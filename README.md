# Sonar scanner
[![CircleCI](https://circleci.com/gh/final-gene/docker-hub-sonar-scanner/tree/master.svg?style=svg)](https://circleci.com/gh/final-gene/docker-hub-sonar-scanner/tree/master) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/bfdd057b2435451092fd0411e96521eb)](https://www.codacy.com/app/final-gene/docker-hub-sonar-scanner?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=final-gene/docker-hub-sonar-scanner&amp;utm_campaign=Badge_Grade)

This is a image to run the [sonar scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner).

## How to use this image
Run the `sonar-scanner` image:

```bash
docker run \
    --rm \
    --env SONAR_HOST_URL=<http://sonar.example.com> \
    --env SONAR_LOGIN_TOKEN=<SONAR_ANALYZIS_TOKEN> \
    --volume ~/.sonar:/cache/.sonar \
    --volume "$(pwd)":/app \
    finalgene/sonar-scanner
```

By default, the `SONAR_USER_HOME` is defined to store data in `/cache/.sonar`.  
Therefor it will be necessary to mount this directory or overide the environment `SONAR_USER_HOME`.

For further information take a look at the [sonar scanner documentation](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner).

## Quick reference
* **Where to get help:**
[the Docker Community Forums](https://forums.docker.com), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

* **Where to file issues:**
https://github.com/finalgene/docker-hub-sonar-scanner/issues

* **Maintained by:**
[The final gene Team](https://github.com/finalgene)

* **Source of this description:**
[Repository README.md](https://github.com/finalgene/docker-hub-sonar-scanner/blob/master/README.md)
