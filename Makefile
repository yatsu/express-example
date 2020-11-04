all: image

USERNAME ?= yatsu
REPO ?= express-example
NAMESPACE ?= default
PREFIX ?= /example/

run:
	node server.js

.PHONY: image
image:
	docker build -t ${USERNAME}/${REPO} .

.PHONY: push
push:
	docker push ${USERNAME}/${REPO}

.PHONY: helm-install
helm-install:
	helm install express-example ./helm --namespace ${NAMESPACE} \
		--set image.repository=${USERNAME}/${REPO},ambassador.prefix=${PREFIX}

.PHONY: helm-uninstall
helm-uninstall:
	helm uninstall express-example --namespace ${NAMESPACE}
