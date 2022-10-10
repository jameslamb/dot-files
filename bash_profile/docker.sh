##########
# Docker #
##########

# [description] remove ALL local docker containers
# [usage] nuke_all_dockers
# [ref] https://github.com/docker/machine/issues/1779
# [ref] https://docs.docker.com/desktop/faqs/macfaqs/
nuke_all_dockers() {
    # kill running containers
    docker kill $(docker ps -qa)
    # delete them
    docker rm -v $(docker ps -qa)
    # remove all images
    docker rmi -f $(docker images -q)
    # remove all volumes
    docker volume rm $(docker volume ls -q)
    # remove everything
    docker system prune --all -f
}

# [description] kill the most recent container you started
# [usage] kill_most_recent_container
kill_most_recent_container() {
    docker kill $(docker ps -ql)
}
