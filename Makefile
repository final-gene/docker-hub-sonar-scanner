NAME = sonar-scanner

VERSIONS = 2.8 2.9 3.0 3.1 3.2 3.3

.PHONY: build
build: ${VERSIONS}

.PHONY: ${VERSIONS}
${VERSIONS}:
	@echo "Build ${@}"

	@docker run \
		--rm \
		--volume "$(shell pwd)":/app \
		finalgene/hadolint \
		${@}/Dockerfile

	@docker build \
		--no-cache \
		--tag finalgene/${NAME}:${@}-dev \
		${@}/

	@docker images finalgene/${NAME}:${@}-dev

.PHONY: clean
clean:
	-@docker rmi \
		--force \
		$(shell docker images finalgene/${NAME}:*-dev -q)
