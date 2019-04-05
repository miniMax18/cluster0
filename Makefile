.DEFAULT_GOAL := help
.PHONY: main bootstrap

#main: galaxy_roles
#	ansible-playbook -K -l local -i inventory playbook.yml

main: cluster-up
	ansible-playbook -K -i inventory playbook.yml
bootstrap: cluster-up
	ansible-playbook -K -k -i inventory bootstrap.yml

.PHONY: cluster-up
cluster-up:
	grep host < inventory | cut -d'=' -f 3 | xargs wakeonlan
cluster-down:
	ansible all -i inventory -b -K -m command -a poweroff

.PHONY: clean
clean:
	rm *.retry
#galaxy_roles: requirements.yml
#	ansible-galaxy install -r requirements.yml --roles-path galaxy_roles
