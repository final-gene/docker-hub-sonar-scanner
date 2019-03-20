FROM openjdk:8-jdk-alpine3.8

LABEL maintainer="frank.giesecke@final-gene.de"

ENV SONAR_SCANNER_VERSION 3.3.0.1492
ENV SONAR_USER_HOME /cache/.sonar

WORKDIR /usr/local/bin

# hadolint ignore=DL3018
RUN apk add --no-cache bash

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache --virtual=.build-deps \
        curl

RUN curl -sSL "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip" | jar xvf /dev/stdin \
        && chmod +x "sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner" \
        && ln -s "sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner" sonar-scanner

# hadolint ignore=DL3018
RUN apk add --no-cache nodejs

RUN apk del .build-deps

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
