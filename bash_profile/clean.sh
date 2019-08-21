#######################
# Cleaning misc stuff #
#######################


clean_brew() {
    echo ""
    echo "==========================="
    echo "= Removing Homebrew stuff ="
    echo "==========================="
    brew cleanup
}

clean_conda(){
    echo ""
    echo "========================"
    echo "= Removing conda stuff ="
    echo "========================"
    conda clean \
        --yes \
        --all
}

clean_pip(){
    echo ""
    echo "======================"
    echo "= Removing pip cache ="
    echo "======================"

    echo "Checking size of the cache"
    PIP_CACHE_DIR=~/Library/Caches/pip/*
    du -sh ${PIP_CACHE_DIR}
    rm -rf ${PIP_CACHE_DIR}/*
    echo "Done cleaning "
}

clean_docker_networks(){
    echo ""
    echo "============================"
    echo "= Removing docker networks ="
    echo "============================"
    echo ""
    echo "docker networks:"
    docker network list
    docker network prune --force
}

clean_docker_images(){
    echo ""
    echo "=================================="
    echo "= Removing all docker containers ="
    echo "=================================="
    nuke_all_dockers
}

clean_everything(){
    clean_brew
    clean_conda
    clean_pip
    clean_docker_networks
    clean_docker_images
}
