.PHONY: lint
lint:
	shellcheck \
		--exclude='SC2046' \
		bash_profile/*.sh
