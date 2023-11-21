.PHONY: init plan apply console clean

out = tfplan.json

init: providers.tf .terraform.lock.hcl
	terraform init

fmt: $(find . -depth 1 -name '*.tf' -print)
	terraform fmt -recursive

plan: $(find . -depth 1 -name '*.tf' -print) .terraform.lock.hcl
	terraform plan -out=$$out

apply: $(find . -depth 1 -name '*.tf' -print) .terraform.lock.hcl $$out
	terraform apply -auto-approve -out=$$out

console: $(find . -depth 1 -name '*.tf' -print)
	terraform console

clean:
	rm -rvf $$out .terraform
