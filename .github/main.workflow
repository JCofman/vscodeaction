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
  args = "publish -p $PUBLISHER_TOKEN"
  needs = ["Master"]
}

