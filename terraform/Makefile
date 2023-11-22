.PHONY: init fmt validate plan apply console clean

init: providers.tf .terraform.lock.hcl
	terraform init

fmt: $(find . -depth 1 -name '*.tf' -print)
	terraform fmt -recursive

plan: $(find . -depth 1 -name '*.tf' -print)
	terraform plan

apply: $(find . -depth 1 -name '*.tf' -print)
	terraform apply

destroy: $(find . -depth 1 -name '*.tf' -print)
	terraform destroy -auto-approve

clean:
	rm -rvf .terraform
