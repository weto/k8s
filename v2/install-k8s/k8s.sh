#!/bin/bash

echo "########## Repositório de imagem ###########"
downloadImagens=`kubeadm config images pull`
echo "######### Download de Imagens ##########"
echo "$downloadImagens"

IP=$1
echo "############# Iniciando kubernetes ############"
kubeInit=`kubeadm init --apiserver-advertise-address=$IP --node-name $HOSTNAME --pod-network-cidr=10.244.0.0/16`
echo "######### Iniciado o cluster ###########"
echo "$kubeInit"

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
  echo "######## WaveNet instalado #########"
else
  installFlannel=`kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml`
  echo "$installFlannel"
  echo "######## Flannel instalado #########"
if

