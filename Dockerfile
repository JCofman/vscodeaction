# Use the latest version of Node.js
#
# You may prefer the full image:
# FROM node
#
# or even an alpine image (a smaller, faster, less-feature-complete image):
# FROM node:alpine
#
# You can specify a version:
# FROM node:10-slim
FROM node:10

# Labels for GitHub to read your action
LABEL "com.github.actions.name"="Vscode release plugin"
LABEL "com.github.actions.description"="This action bundles vsce tool to release a vscode plugin"
# Here all of the available icons: https://feathericons.com/
LABEL "com.github.actions.icon"="play"
# And all of the available colors: https://developer.github.com/actions/creating-github-actions/creating-a-docker-container/#label
LABEL "com.github.actions.color"="gray-dark"

# Install dependencies
RUN npm install -g vsce typescript webpack --unsafe-perm

# Run `node /entrypoint.js`
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
