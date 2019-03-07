#!/bin/bash

BRANCH=${GITHUB_REF##refs/heads/}

echo "Running scanner on branch: $BRANCH"
echo "Sending results to: $SONAR_ORG/$SONAR_PROJECT_KEY"

/tmp/sonar/sonar-scanner-$SONAR_VERSION-linux/bin/sonar-scanner \
  -Dsonar.projectKey=$SONAR_PROJECT_KEY \
  -Dsonar.organization=$SONAR_ORG \
  -Dsonar.sources=/github/workspace \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=$SONAR_LOGIN \
  -Dsonar.branch.name=$BRANCH

