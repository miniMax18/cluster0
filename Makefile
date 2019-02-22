.DEFAULT_GOAL := main
.PHONY: main bootstrap

#main: galaxy_roles
#	ansible-playbook -K -l local -i inventory playbook.yml

main:
	ansible-playbook -K -i inventory playbook.yml
bootstrap:
	ansible-playbook -K -k -i inventory bootstrap.yml

.PHONY: clean
clean:
	rm *.retry
#galaxy_roles: requirements.yml
#	ansible-galaxy install -r requirements.yml --roles-path galaxy_roles
