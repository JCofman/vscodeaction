# 👌 VScode action to release a plugin

This Action tries to release a VScode plugin via the [vsce](https://github.com/microsoft/vscode-vsce) tool.

Make sure to pass a PUBLISHER_TOKEN an explanation on how to register a token can be found [here](https://code.visualstudio.com/api/working-with-extensions/publishing-extension).

You have to create an [Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/create-organization?view=azure-devops) organization to publish a VScode extension.

| Steps                                                                                                                             | Picture                                                                                                        |
| --------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| 1. Create an account or sign in into your existing account by going to [here](https://azure.microsoft.com/en-us/services/devops/) | ![1 Step](https://user-images.githubusercontent.com/2118956/63128374-142d2700-bfb5-11e9-8612-7a6889742a87.png) |
| 2. Go to [dev azure portal](https://dev.azure.com) and create a new organization by clicking the button down below + new organizaion | ![2 Step](https://user-images.githubusercontent.com/2118956/63128400-24dd9d00-bfb5-11e9-8609-5e4e277da74c.png) |
| 3. Go to [dev azure portal](https://dev.azure.com) and create a new organization by clicking the button down below + new organizaion | ![3 Step](https://user-images.githubusercontent.com/2118956/63128416-2eff9b80-bfb5-11e9-930f-76980bff2ae3.png) |
| 4. Go to [dev azure portal](https://dev.azure.com) and create a new organization by clicking the button down below + new organizaion | ![4 Step](https://user-images.githubusercontent.com/2118956/63128435-3d4db780-bfb5-11e9-9c85-044e23fa9a41.png) |
| 5. Make sure that you have defined the following information in the package.json |

```js
    // package.json
    {
    "name": "your extension name", // ⚠️ make sure to use a unique name
    "displayName": "testExtension",
    "description": "",
    "version": "0.0.1", // ⚠️ you can not release a package twice with the same version
    "repository": "https://github.com/JCofman/vscodeaction",
    "publisher": "YOUR_PUBLISHER_NAME", // ⚠️ be aware that the publisher field must match the logged in vsce publisher...
    }
``` 



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

````
