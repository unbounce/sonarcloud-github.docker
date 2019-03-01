FROM node:8.15.0-jessie-slim
MAINTAINER Unbounce Security

#
# This is the work directory used by GitHub Actions
#
WORKDIR /github/workspace

#
# The version of SonarCloud CLI we want to use.
#
ENV SONAR_VERSION=3.2.0.1227

#
# The full URL to the SonarCloud CLI linux package from their CDN.
#
ENV SONAR_DOWNLOAD_URL=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_VERSION-linux.zip

#
# Install any necessary libraries and tools
#
RUN apt-get update -qq && apt-get install unzip -y

#
# Ensure TypeScript runtime is installed (required by Sonar Scanner)
#
RUN npm install -g typescript

#
# Download and install the SonarCloud client
#
ADD $SONAR_DOWNLOAD_URL /tmp/scanner.zip
RUN mkdir -p /tmp/sonar && unzip /tmp/scanner.zip -d /tmp/sonar
RUN rm /tmp/scanner.zip

#
# The scanner needs to know where the Node libraries are installed.
# Not sure why, it's just a formality.
#
ENV NODE_PATH /usr/local/lib/node_modules

#
# Add in the custom script that allows us to manipulate the GITHUB_REF
# env var so that the data in SonarCloud is clean.
#
ADD scanner.sh /root/scanner.sh

#
# Ensure the scanner is started at container runtime
#
CMD /root/scanner.sh

