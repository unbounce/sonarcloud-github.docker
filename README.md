# SonarCloud Docker Image for use with Github Actions

This is a Docker image that is designed for use with Github Actions.
Technically it will work anywhere, but it sets specific directory
structure and environment variables that are designed to conform to the
Github Actions architecture.

## Releases

Go to hub.docker.com/unbounce/sonarcloud to download the pre-built Docker
image.

## Running Locally

You need to mount your code into a specific directory structure plus
provide a number of environment variable.  Use this code snippet as a
guide.

```bash
docker run \
  -v /path/to/project/code/:/github/workspace/ \
  --env SONAR_LOGIN=... \
  --env GITHUB_REF=<branch name> \
  --env SONAR_ORG=... \
  --env SONAR_PROJECT_KEY=... \
  sonarcloud-github
```

Please note that you are supplying this `docker run` command with a
password to your SonarCloud account.  This may show up in `docker history`
or bash `history` commands.  Take care where you run this command.

## Build from Source

Run `make build` to build a new image.

You will be unable to tag or release any Docker image unless you have
credentials to Unbounce's Docker account.

## MIT LICENSE

See [LICENSE](LICENSE) for details.

