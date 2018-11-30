
## docker environment
os : ubuntu 16.04
python : 3.6.5
solc : 0.4.24(you can install other versions using install_solc method)

## 1. pull docker image
#docker pull vincentkim/ubuntu_jupyterlab_solidity

## 2. create container using bellow command.
(options. you can delete if you don't need to set)
-v : volume, you can link your repository with inside docker repository.
-p : port forwarding.

#sudo docker run -i -t -d -p 7777:8888 -v /home/taeoh/code:/marker/notebooks --name ubuntu_jupyterlab_solidity -e GRANT_SUDO=yes --user root vincentkim/ubuntu_jupyterlab_solidity

## 3. check token using 'logs' command
#sudo docker logs ubuntu_jupyterlab_solidity

## 4. enjoy!
