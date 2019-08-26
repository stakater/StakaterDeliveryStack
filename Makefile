.ONESHELL:
SHELL := /bin/bash
NAMESPACE ?= delivery
FOLDER_NAME ?= manifests
INSTALL_PVC ?= false

install:
	kubectl create namespace $(NAMESPACE) || true

	cd $(FOLDER_NAME)
	@if [ $(INSTALL_PVC) = true ]; then\
		cd pvc/;\
		kubectl apply -f . -n $(NAMESPACE);\
		cd ..;\
	fi

	kubectl apply -f . -n $(NAMESPACE)

install-dry-run:
	cd $(FOLDER_NAME)
	@if [ $(INSTALL_PVC) = true ]; then\
		cd pvc/;\
		kubectl apply -f . -n $(NAMESPACE) --dry-run;\
		cd ..;\
	fi

	kubectl apply -f . -n $(NAMESPACE) --dry-run
	
delete:
	cd $(FOLDER_NAME)
	kubectl delete -f . -n $(NAMESPACE)
