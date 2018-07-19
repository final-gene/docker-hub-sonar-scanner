FROM openjdk:8-jdk-slim-stretch

LABEL maintainer="frank.giesecke@final-gene.de"

ENV SONAR_SCANNER_VERSION "3.1.0.1141"
ENV SONAR_USER_HOME /cache/.sonar
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /usr/local/bin

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl=7.52.1-5+deb9u6 \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sSL "https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip" | jar xvf /dev/stdin \
        && chmod +x "sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner" \
        && ln -s "sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner" sonar-scanner

RUN apt-get remove -y \
        curl

RUN echo "dash dash/sh boolean false" | debconf-set-selections \
    && dpkg-reconfigure dash

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
