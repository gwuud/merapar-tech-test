.PHONY: init plan apply console clean

OUT = tfplan.json

init: providers.tf .terraform.lock.hcl
	terraform init

fmt: $(find . -depth 1 -name '*.tf' -print)
	terraform fmt -recursive

plan: $(find . -depth 1 -name '*.tf' -print) .terraform.lock.hcl
	terraform plan -out=$$OUT

apply: $(find . -depth 1 -name '*.tf' -print) .terraform.lock.hcl $$OUT
	terraform apply -auto-approve -out=$$OUT

console: $(find . -depth 1 -name '*.tf' -print)
	terraform console

clean:
	rm -rvf $$OUT .terraform
