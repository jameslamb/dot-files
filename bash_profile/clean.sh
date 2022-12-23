#!/bin/bash

#######################
# Cleaning misc stuff #
#######################

# https://davidwalsh.name/brew-cleanup
# https://docs.docker.com/desktop/mac/space/
# https://mackeeper.com/blog/mac-system-storage-cleaning/
clean_everything (){

    echo ""
    echo "==========================="
    echo "= Removing Homebrew stuff ="
    echo "==========================="
    brew cleanup -s

    echo ""
    echo "========================"
    echo "= Removing conda stuff ="
    echo "========================"
    conda clean \
        --yes \
        --all

    echo ""
    echo "======================"
    echo "= Removing pip cache ="
    echo "======================"

    echo "Checking size of the cache"
    du -sh "${HOME}/Library/Caches/pip"
    rm -rf "${HOME}/Library/Caches/pip/*"
    echo "Done cleaning "

    echo ""
    echo "============================"
    echo "= Removing docker networks ="
    echo "============================"
    echo ""
    echo "docker networks:"
    docker network list
    docker network prune --force

    echo ""
    echo "=================================="
    echo "= Removing all docker containers ="
    echo "=================================="
    nuke_all_dockers
    # there is also a ton of stuff in /Users/jlamb/Library/Containers
}
