// entrypoint.js
const { exec } = require('child_process');
const { Toolkit } = require('actions-toolkit');

const tools = new Toolkit();

// check pre-requirements
if (!checkForMissingEnv) tools.exit.failure('Failed!');

// run the script
release();

async function release() {
  const publishToken = process.env.PUBLISH_TOKEN;
  try {
    let { stdout } = await sh(`npm run vscode:publish -- -p ${publishToken}`);
    if (stdout) {
      tools.exit.success(`Succesfully run! ${stdout}`);
    }
  } catch (error) {
    tools.log.error(`Somehting went wrong ${error}`);
    tools.exit.failure('Failed!');
  }
}

/**
 * Execute shell command
 * @param {String} cmd
 * @return {Object} { stdout: String, stderr: String }
 */
async function sh(cmd) {
  return new Promise(function(resolve, reject) {
    exec(cmd, (err, stdout, stderr) => {
      if (err) {
        reject(err);
      } else {
        resolve({ stdout, stderr });
      }
    });
  });
}

/**
 * Log warnings to the console for missing environment variables
 */
function checkForMissingEnv() {
  const requiredEnvVars = [
    'HOME',
    'GITHUB_WORKFLOW',
    'GITHUB_ACTION',
    'GITHUB_ACTOR',
    'GITHUB_REPOSITORY',
    'GITHUB_EVENT_NAME',
    'GITHUB_EVENT_PATH',
    'GITHUB_WORKSPACE',
    'GITHUB_SHA',
    'GITHUB_REF',
    'GITHUB_TOKEN',
    'VSCE_TOKEN'
  ];

  const requiredButMissing = requiredEnvVars.filter(
    key => !process.env.hasOwnProperty(key)
  );
  if (requiredButMissing.length > 0) {
    // This isn't being run inside of a GitHub Action environment!
    const list = requiredButMissing.map(key => `- ${key}`).join('\n');
    const warning = `There are environment variables missing from this runtime.\n${list}`;
    tools.log.warn(warning);
    return false;
  } else {
    return true;
  }
}
