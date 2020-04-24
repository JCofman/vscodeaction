# 👌 VScode action to release a plugin

## Affiliate

If you like to support my OSS work you could "buy me a coffee"

<a href="https://www.buymeacoffee.com/jcofman" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/lato-yellow.png" alt="Buy Me A Coffee" width="201" height="51" ></a>

or want to take a look on tools I recommend you could checkout.
<table><tr><td align="center"><a href="https://a.paddle.com/v2/click/49831/106566?link=1947" target="_blank"><img src="https://img.stackshare.io/service/6882/687474703a2f2f692e696d6775722e636f6d2f446d6d4a56335a2e706e67.png" alt="Buy Me A Coffee" width="50" height="50" ><br /><sub><b>Sizzy</b></sub></a><br /> A super useful App when developing for different screens</a></td></tr></table>

## General

This Action tries to release a VScode plugin via the [vsce](https://github.com/microsoft/vscode-vsce) tool.

Make sure to pass a PUBLISHER_TOKEN an explanation on how to register a token can be found [here](https://code.visualstudio.com/api/working-with-extensions/publishing-extension).

You have to create an [Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/create-organization?view=azure-devops) organization to publish a VScode extension.

| Steps                                                                                                                                                 | Picture                                                                                                        |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| 1. Create an account or sign in into your existing account by going to [here](https://azure.microsoft.com/en-us/services/devops/)                     | ![1 Step](https://user-images.githubusercontent.com/2118956/63128374-142d2700-bfb5-11e9-8612-7a6889742a87.png) |
| 2. Go to [dev azure portal](https://dev.azure.com) and create a new organization by clicking `New Organizaion`                                        | ![2 Step](https://user-images.githubusercontent.com/2118956/63128400-24dd9d00-bfb5-11e9-8609-5e4e277da74c.png) |
| 3. Click on your profile picture and on the menu item `Security`                                                                                      | ![3 Step](https://user-images.githubusercontent.com/2118956/63128416-2eff9b80-bfb5-11e9-930f-76980bff2ae3.png) |
| 4. Create a new token and make sure you have selected `All accessible organizations` and `Custom defined` permissions to allow manage the marketplace | ![4 Step](https://user-images.githubusercontent.com/2118956/63128435-3d4db780-bfb5-11e9-9c85-044e23fa9a41.png) |
| 5. Make sure that you have defined the following information in the package.json                                                                      |

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

```yml
on: push
name: 'Release Vscode Plugin'
jobs:
  npmInstall:
    name: npm install
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: npm install
        uses: actions/npm@master
        with:
          args: install --unsafe-perm
      - name: Master
        uses: actions/bin/filter@master
        with:
          args: branch master
      - name: Vscode release plugin
        uses: JCofman/vscodeaction@master
        env:
          PUBLISHER_TOKEN: ${{ secrets.PUBLISHER_TOKEN }}
        with:
          args: publish -p $PUBLISHER_TOKEN
```
