# VERSION
# If no version is specified as a parameter of make, the last git hash
# value is taken.
VERSION:=$(or ${TRAVIS_TAG}, latest)

# DOCKER_USER
DOCKER_USER?=volkerraschek

build:
		docker build \
			--tag ${DOCKER_USER}/cupsd:${VERSION} \
			.

push: build
	docker login --username ${DOCKER_USER} --password ${DOCKER_PASSWORD}
	docker push ${DOCKER_USER}/cupsd:${VERSION}
