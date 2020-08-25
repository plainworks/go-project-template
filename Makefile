export GOBIN := $(PWD)/bin
GO_PATH:=$(shell go env GOPATH)
export PATH:=$(GOBIN):$(GO_PATH):$(PATH)

install-tools:
	@./tools/install-go-tools.sh ./tools/tools.go

install-go:
	@./tools/install-go.sh

update-go-modules:
	@go mod tidy

setup: install-go install-tools update-go-modules

lint:
	$(GOMOD) $(GOBIN)/golangci-lint run