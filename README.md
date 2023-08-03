# build-security-action
GitHub Action for KhulnaSoft Build Security

## Usage

Add the below workflow into your existing build or as a new workflow.

```yaml
name: build
on:
  push:
    branches:
      - master
  pull_request:

jobs:
  build:
    name: Build
    runs-on: ubuntu-18.04
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Run KhulnaSoft Build Security
        uses: khulnasoft-labs/build-security-action@main
        with:
          khulnasoft_key: ${ secret.KHULNASOFT_KEY }
          khulnasoft_secret: ${ secret.KHULNASOFT_SECRET }


```

### What does it do?

The workflow is going to checkout the PR or branch as appropriate then run the KhulnaSoft Build Security Trivy command against it and upload the results.

### Required Parameters

There are two required parameters, these can be grabbed from CSPM. You'll need you `KHULNASOFT_KEY` and `KHULNASOFT_SECRET`, please contact KhulnaSoft Support if you have issues getting these.
