KUBE_CONTEXT	:= default
KUBECONFIG		:= /Users/user/.kube/k3s.config
ENV						:= dev
RELEASE_NAME  := frieeren

.PHONY: deploy
deploy:
	helm upgrade $(RELEASE_NAME) ./ --install \
		--kube-context=$(KUBE_CONTEXT) \
		--kubeconfig=$(KUBECONFIG) \
		-f values.yaml \
		--set env=$(ENV)

.PHONY: uninstall
uninstall:
	helm uninstall $(RELEASE_NAME) \
		--kube-context=$(KUBE_CONTEXT) \
		--kubeconfig=$(KUBECONFIG)