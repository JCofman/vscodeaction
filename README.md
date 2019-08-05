# 👌 Vscode action to release a plugin

This Action tries to release a vscode plugin via the [vsce](https://github.com/microsoft/vscode-vsce) tool.

Make sure to pass a PUBLISH_TOKEN an explanation on how to register a token can be found [here](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)

## 🔑 Secrets

- PUBLISHER - Required to publish a release to vscode Marketplace
- PUBLISHER_TOKEN - Required to publish a release to vscode Marketplace

## 💻 Examples

Trigger a release

```hcl

workflow "Release Vscode Plugin " {
  resolves = ["Vscode release plugin"]
  on = "release"
}

action "Vscode release plugin" {
  uses = "JCofman/vscodeaction@master"
  args= "publish"
  secrets = ["PUBLISHER_TOKEN", "PUBLISHER"]
}

```
