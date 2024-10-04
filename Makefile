SHELL := /bin/bash

-include .env

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build the project’s smart contracts.
	forge build

clean: ## Remove the build artifacts and cache directories.
	forge clean
	
tests: ## Run the project’s tests.
	forge test

deploy-real-estate-token: ## Deploy the RealEstateToken contract.
	forge script script/DeployRealEstateToken.s.sol:DeployScript --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify --etherscan-api-key ${ETHERSCAN_API_KEY} -vvvv
