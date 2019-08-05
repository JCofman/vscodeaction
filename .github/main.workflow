workflow "Release Vscode Plugin " {
  resolves = ["Vscode release plugin"]
  on = "push"
}

action "Vscode release plugin" {
  uses = "JCofman/vscodeaction@master"
  args = "publish"
  secrets = [
    "PUBLISHER_TOKEN",
    "PUBLISHER",
  ]
}
