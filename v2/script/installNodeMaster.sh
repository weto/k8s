#!/bin/bash
#Desabilitando Swap
#swap_off=`wapoff -a && sudo sed -i '/ swap / s/^/#/' /etc/fstab`
#echo "$swap_off"

# Iniciando o cluster
IP_MASTER=$1
#kubeadmInit=`kubeadm init --apiserver-advertise-address=$IP_MASTER --node-name $HOSTNAME --pod-network-cidr=10.244.0.0/16`
kubeadmInit=`kubeadm init --pod-network-cidr=10.244.0.0/16`
echo "$kubeadmInit"
#kubeadm init

# Criando diretórios de Pastas
pastaKube=`mkdir -p $HOME/.kube`
pastaconfig=`cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`
permissao=`chown $(id -u):$(id -g) $HOME/.kube/config`

echo "$pastakube"
echo "$pastaconfig"
echo "$permissao"

# Instalar Pod de comunicacao de rede flannel
flannelInstall=`kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml`
echo "$flannelInstall"

