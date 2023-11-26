#!/bin/bash

#######
# Git #
#######

# tab completion
source /usr/local/etc/bash_completion.d/git-completion.bash

# [description] Overwrite last commit with last message and force push
#               onto current branch
# [usage] force_update
force_update() {
	git commit -m "$(git log -1 --pretty=%B | cat)" --amend && \
	git push origin $(git rev-parse --abbrev-ref HEAD) --force
}

# [description] Clone a fork from Github and set up remotes to make
#               open source workflow easier. It's valuable to set
#               one remote for your fork (to push changes) and another
#               for the upstream project (to keep your fork in sync)
# [usage]
#.
#.     oss_clone jameslamb pkgnet
#
# [requires] curl git jq tr
oss_clone() {
    
    # Clone the fork
    local GH_USER=$1
    local PROJECT=$2
    local FORK="git@github.com:${GH_USER}/${PROJECT}.git"
    git clone "${FORK}"

    # Step into the project
    cd "${PROJECT}" || exit 1

    # Go find the upstream project
    UPSTREAM=$(
        curl -X GET \
        "https://api.github.com/repos/${GH_USER}/${PROJECT}" |
        jq '.parent' |
        jq '.ssh_url' |
        tr -d '"'
    )

    # set upstream
    git remote add upstream "${UPSTREAM}"

    echo ""
    echo "Done setting up your local dev instance of ${PROJECT}"
    git remote -v
}

# [description] Push current branch to remote without
#               needing to type out the branch name.
# [usage]
#     # push to 'origin'
#     gp
#
#     # push to some other remote
#     gp upstream
#
# [requires] git
gp() {
    local remote=${1:-origin}
    git push "${remote}" HEAD
}

# [description] Remove all files in a repo that are explicitly
#               ignored by git
# [usage]
# 
#      gpclean
#
# [requires] git
gclean() {
    git clean -d -f -X
}

# [description] Create and push an empty commit.
#               Used to trigger actions that happen automatically
#               on commits, such as continuous integration builds.
# [usage]
# 
#      push_empty
#
# [requires] git
push_empty() {
    git commit --allow-empty -m "empty commit"
    git push origin HEAD
}
