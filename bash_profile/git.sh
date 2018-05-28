#######
# Git #
#######

# [description] Overwrite last commit with last message and force push
#               onto current branch
# [usage] force_update
force_update() {
	git commit -m "$(git log -1 --pretty=%B | cat)" --amend && \
	git push origin $(git rev-parse --abbrev-ref HEAD) --force
}

# [description] Remove a branch, get the remote version, checkout to it.
# [usage] refresh_branch() feature/blegh
refresh_branch() {
	git checkout master && \
	git pull origin master && \
	git branch -D $1 && \
	git fetch origin $1 && \
	git checkout $1 && \
	git branch -v
}
