#!/bin/bash
reset=`kubeadm reset && rm -rf ~/.kube/`
install=`kubeadm init --apiserver-advertise-address=192.168.0.20 --node-name $HOSTNAME --pod-network-cidr=10.244.0.0/16`
criandoDiretorios=`mkdir -p $HOME/.kube && cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && chown $(id -u):$(id -g) $HOME/.kube/config`
echo "######### apagando kubeadm ##########"
echo "$reset"
echo "#### Fazendo uma nova instalação ####"
echo "$install"
echo "######## Criando diretórios #########"
echo "$criandoDiretorios"
