function set_docker {
  cd ~/Documents/boot2docker
  export DOCKER_HOST="tcp://`vagrant ssh-config | sed -n "s/[ ]*HostName[ ]*//gp"`:2375"
  cd -
}
