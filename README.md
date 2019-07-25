<img src="http://cdn2-cloud66-com.s3.amazonaws.com/images/oss-sponsorship.png" width=150/>

# GitHub Actions for Cloud 66 Toolbelt #
This repository contains GitHub Actions for [Cloud 66 Toolbelt](https://github.com/cloud66-oss/cx), which would allow users to perform common tasks available through cx (such as deployment), using GitHub Actions.

# Usage #

Below have been provided two example workflows, which demonstrate the two ways in which Cloud 66 Toolbelt commands can be passed to the Cloud 66 GitHub Action. Both result in redeployment of a Cloud 66 stack, named "my_stack".

The first option is to provide the name of the stack as an environment variable and to pass the cx command as an argument, containing the name of the environment variable, as can be seen below:

```
workflow "New workflow" {
  on = "push"
  resolves = ["cloud66"]
}

action "cloud66" {
  uses = "./.cloud66/cx"
  secrets = ["CLOUD66_TOKEN"]
  args = "redeploy --stack CLOUD66_STACK -y --listen"
  env = {
    CLOUD66_STACK = "my-stack"
  }
}
```
The second option is to pass the cx command and the name of the stack together as an argument. This would look like this:
```
workflow "New workflow" {
  on = "push"
  resolves = ["cloud66"]
}

action "cloud66" {
  uses = "./.cloud66/cx"
  args = "redeploy --stack my-stack -y --listen"
  secrets = ["CLOUD66_TOKEN"]
}
```

## Secrets ##
Both options would need the content of the cx token file to be passed as a secret. This would enable cx. The content can be accessed by running the ```cx dump-token | base64``` command on your local device. The result can then be used as a value of a secret with key ```CLOUD66_TOKEN```. Note that the name of the secret cannot be anything else, since cx will not recognise it.

## Environment Variables ##
The use of environment variables is a matter of personal choice, since anything that is passed as an environment variable, can also be directly provided in the arguments part. 

In this case, this is ```CLOUD66_STACK = "my-stack"``` in the first example and there is no environment variable in the second example. 

# License #
See LICENSE
