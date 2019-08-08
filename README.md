# 👌 Vscode action to release a plugin

This Action tries to release a vscode plugin via the [vsce](https://github.com/microsoft/vscode-vsce) tool.

Make sure to pass a PUBLISHER_TOKEN an explanation on how to register a token can be found [here](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)

## 🔑 Secrets

- PUBLISHER_TOKEN - Required to publish a release to vscode Marketplace

## 💻 Examples

Trigger a release

```hcl

workflow "Release Vscode Plugin " {
  resolves = ["Vscode release plugin"]
  on = "push"
}

# Check for master branch
action "Master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
  needs = ["npm install"]
}

# install dependencies
action "npm install" {
  uses = "actions/npm@master"
  args = ["install", "--unsafe-perm"]
}

# run release
action "Vscode release plugin" {
  uses = "JCofman/vscodeaction@master"
  secrets = ["PUBLISHER_TOKEN"]
  args = "publish -p $VSCE_TOKEN"
  needs = ["Master"]
}

```
