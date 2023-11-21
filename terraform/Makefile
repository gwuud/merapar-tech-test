.PHONY: init plan console

init: providers.tf .terraform.lock.hcl
	terraform init

fmt: $(find . -depth 1 -name '*.tf' -print)
	terraform fmt -recursive

plan: $(find . -depth 1 -name '*.tf' -print)
	terraform plan -out=tfplan.json

console: $(find . -depth 1 -name '*.tf' -print)
	terraform console