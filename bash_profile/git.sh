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

# [description] Clone a fork from Github and set up remotes to make
#               open source workflow easier. It's valuable to set
#               one remote for your fork (to push changes) and another
#               for the upstream project (to keep your fork in sync)
# [usage]
#.
#.     oss_clone jameslamb pkgnet
#
# [requires] curl git jq tr
oss_clone (){
    
    # Clone the fork
    local GH_USER=$1
    local PROJECT=$2
    local FORK="git@github.com:${GH_USER}/${PROJECT}.git"
    git clone ${FORK}

    # Step into the project
    cd ${PROJECT}

    # Go find the upstream project
    UPSTREAM=$(
        curl -X GET \
        "https://api.github.com/repos/${GH_USER}/${PROJECT}" |
        jq '.parent' |
        jq '.ssh_url' |
        tr -d '"'
    )

    # set upstream
    git remote add upstream ${UPSTREAM}

    echo ""
    echo "Done setting up your local dev instance of ${PROJECT}"
    git remote -v
}
