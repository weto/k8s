#!/bin/bash
# Iniciando o cluster
kubeadm init --apiserver-advertise-address=192.168.0.24 --node-name $HOSTNAME --pod-network-cidr=10.244.0.0/16
#kubeadm init

# Criando diretórios de Pastas
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# Instalar Pod de comunicacao de rede flannel
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

