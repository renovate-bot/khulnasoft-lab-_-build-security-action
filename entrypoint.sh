#!/bin/bash

set -e

# configure Vul to use the khulnasoft plugin

if [ -n "${INPUT_KHULNASOFT_CSPM_URL}" ]; then
  export CSPM_URL=${INPUT_KHULNASOFT_CSPM_URL}
fi

if [ -n "${INPUT_KHULNASOFT_API_URL}" ]; then
  export KHULNASOFT_URL=${INPUT_KHULNASOFT_API_URL}
fi

# if GITHUB_WORKSPACE is defined, move to it
if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

# check if any custom build name has been specified
BUILD=${INPUT_BUILD:-GitHubAction}

# Execute Vul
export VUL_RUN_AS_PLUGIN=khulnasoft
vul iac --tags "system:github" \
          --tags "build:${BUILD}" \
          --tags "repository:${GITHUB_REPOSITORY}" \
          --tags "branch:${GITHUB_REF_NAME}" \
          --tags "git_user:${GITHUB_ACTOR}" \
          --khulnasoft-key "${INPUT_KHULNASOFT_KEY}" \
          --khulnasoft-secret "${INPUT_KHULNASOFT_SECRET}" \
          "${GITHUB_WORKSPACE}"
