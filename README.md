<img src="http://cdn2-cloud66-com.s3.amazonaws.com/images/oss-sponsorship.png" width=150/>

# GitHub Actions for Cloud 66 Toolbelt #
This repository contains GitHub Actions for [Cloud 66 Toolbelt](https://help.cloud66.com/docs/toolbelt/toolbelt), which would allow users to perform common tasks available through cx (such as deployment), using GitHub Actions.

# Usage #

Two example workflows have been provided below demonstrating two ways in which Cloud 66 Toolbelt commands can be passed to the Cloud 66 GitHub Action. Both of these example workflows result in a redeployment of a Cloud 66 stack, named "my_stack".

The first example provides the name of the stack as an environment variable. This environment variable is then passed to the toolbelt command. 

## Example 1 ##

```
name: Cloud66Action
on: push
env:
  CLOUD66_TOKEN: ${{ secrets.SECRETS }}
  CLOUD66_STACK: "my_stack"
jobs:
  test-job:
    name: Test Job
    runs-on: ubuntu-latest
    container:
      image: cloud66/cx:latest
    steps:
      - run: cx redeploy --stack CLOUD66_STACK -y --listen
```
The second example passes the name of the stack directly to the toolbelt command.

## Example 2 ##

```
name: Cloud66Action
on: push
env:
  CLOUD66_TOKEN: ${{ secrets.SECRETS }}
jobs:
  test-job:
    name: Test Job
    runs-on: ubuntu-latest
    container:
      image: cloud66/cx:latest
    steps:
      - run: cx redeploy --stack my_stack -y --listen
```

## Secrets ##
Both options would need the content of the cx token file to be passed as a secret to authenticate an account with the toolbelt. The content can be accessed by running the ```cx dump-token | base64``` command on your local device that is already authenticated to a Cloud 66 account. The result can then be used as a value of a secret with key ```CLOUD66_TOKEN```. Note that the name of the secret must be ```CLOUD66_TOKEN```. For help adding the secret to your Github, please see [this](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions) help page.

## Environment Variables ##
The use of environment variables is a matter of personal choice, since anything that is passed as an environment variable, can also be directly provided in the arguments part. 

In this case, this is ```CLOUD66_STACK = "my-stack"``` in the first example and there is no environment variable in the second example. 

# License #
See LICENSE
