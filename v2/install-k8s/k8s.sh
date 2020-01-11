#!/bin/bash

echo "######## Iniciando processo de instalacao kubernetes #########"
installk8s=`apt-get install kubelet kubeadm kubectl -y`
echo "########### Instalando o kubernetes ###########"
echo "$installK8s"

echo "########## Repositório de imagem ###########"
downloadImagens=`kubeadm config images pull`
echo "######### Download de Imagens ##########"
echo "$downloadImagens"

echo "######### Desabilitando Swap ##########"
disableSwap=`swapoff -a`
echo "############# Desabilitando Swap ##############"
echo "$disableSwap"

IP=$1
echo "############# Iniciando kubernetes ############"
iniciandoK8s=`kubeadm init`
install=`kubeadm init --apiserver-advertise-address=$IP --node-name $HOSTNAME --pod-network-cidr=10.244.0.0/16`
echo "######### Iniciado o cluster ###########"
echo "$iniciandoK8s"

echo "######## Criando diretórios de pastas #########"
criandoDiretorios=`mkdir -p $HOME/.kube && cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && chown $(id -u):$(id -g) $HOME/.kube/config`
echo "######### Criando diretórios ###########"
echo "$criandoDiretorios"

echo "######### Instalando POD Network [$2] ###########"
POD_NETWORK=$2
if [POD_NETWORK == "weave"]; then
  #echo "############ instalando POD Network ###########"
  installWaveNet=`kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"`
  #echo "######## Intalando POD Network WaveNet ########"
  echo "$installWaveNet"
else
  installPN=`kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"`
  echo "$installPN"
if

