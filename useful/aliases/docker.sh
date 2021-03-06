#!/usr/bin/env bash
# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpsa="docker ps -a"

# Get images
alias di="docker images"

# Run daemonized container, e.g., $dkd base /bin/echo hello
alias drund="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias drun="docker run -i -t -P"

# Execute command in container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
func_dstop() { docker stop $(docker ps -a -q); }
alias dstop=func_dstop

# Stop and Remove are chosen containers
# drmc "postgres" - delete postgres container
# drmc ".*" - delete all containers
func_drmc() { docker ps -a | egrep "$1" | grep -v "CONTAINER" | awk '{ printf "%s\n", $1}' | xargs docker rm -f; }
alias drmc=func_drmc

# Delete docker volumes
func_drmd() { docker volume ls | egrep "$1" | grep -v "VOLUME" |awk '{ printf "%s\n", $2}' | xargs docker volume rm; }
alias drmd=func_drmd

# Remove chosen images
# drmi "postgres" - delete postgres image
# drmi ".*" - delete all images
func_drmi() {
    func_drmc "$1"
    docker images -a | egrep "$1" | grep -v "IMAGE" | awk '{ printf "%s\n", $3}' | xargs docker rmi -f;
}
alias drmi=func_drmi

func_flushdb() {
    drmc ".*" 
    drmd images_dev_dbdata
    dc up -d postgres
    sleep 4
    dc run m-backend migrate

}
# Flush postgres databse - delete container and delete docker volume
alias flushdb=func_flushdb

# Connect to the postgres database and execute the command if exist
func_pdbconnect() {
    echo "Command: $@"
    if [ -z "$@" ]; then
        psql -h dev.absortium.com  -p 5432 -U postgres
    else
        psql -h dev.absortium.com  -p 5432 -U postgres -c "$@"
    fi
}
alias pdbconnect=func_pdbconnect

func_pdboffers() {
    if [ -z "$@" ]; then
        func_pdbconnect "select * from absortium_offer;"
    else
        func_pdbconnect "select * from absortium_offer $@;"
    fi
}
alias pdboffers=func_pdboffers

func_pdbaccounts() {
    if [ -z "$@" ]; then
        func_pdbconnect "select * from absortium_account;"
    else
        func_pdbconnect "select * from absortium_account $@;"
    fi
    
}
alias pdbaccounts=func_pdbaccounts

func_pdborders() {
    if [ -z "$@" ]; then
        func_pdbconnect "select * from absortium_order;"
    else
        func_pdbconnect "select * from absortium_order $@;"
    fi
}
alias pdborders=func_pdborders

# Clean rabbitmq celery queue
alias cleanrabbit="dex rabbitmq rabbitmqctl purge_queue celery"
