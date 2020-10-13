# Docker environment for testing ansible
## Running
    docker run -ti --rm --mount type=bind,source=$(pwd)/ansible/playbook.yml,target=/playbook.yml renancamargo/ansible ansible-playbook playbook.yml
