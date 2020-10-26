all: image

USERNAME ?= anonymous
REPO ?= express-example

.PNONY: image
image:
	docker build -t ${USERNAME}/${REPO} .

.PNOLY: push
push:
	docker push ${USERNAME}/${REPO}
