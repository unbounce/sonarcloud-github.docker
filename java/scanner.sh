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
  -Dsonar.branch.name=$BRANCH \
  -Dsonar.java.binaries=$JAVA_BINARIES_LOCATION \
  -Dsonar.java.libraries=$JAVA_LIBRARIES_LOCATION \
  -Dsonar.java.test.binaries=$JAVA_TEST_BINARIES_LOCATION \
  -Dsonar.java.test.libraries=$JAVA_TEST_LIBRARIES_LOCATION

