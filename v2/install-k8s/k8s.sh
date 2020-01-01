#!/bin/bash

#installk8s=`apt-get install -y kubelet kubeadm kubectl`
#echo "########### Instalando o kubernetes ###########"
#echo "$installK8s"

downloadImagens=`kubeadm config images pull`
echo "######### Download de Imagens ##########"
echo "$downloadImagens"

#disableSwap=`swapoff -a`
#echo "############# Desabilitando Swap ##############"
#echo "$disableSwap"

#iniciandoK8s=`kubeadm init`
#echo "######### Iniciado o cluster ###########"
#echo "$iniciandoK8s"

#criandoDiretorios=`mkdir -p $HOME/.kube && cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && chown $(id -u):$(id -g) $HOME/.kube/config`
#echo "######### Criando diretórios ###########"
#echo "$criandoDiretorios"

#installWaveNet=`kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"`
#echo "######## Intalando POD Network WaveNet ########"
#echo "$installWaveNet"

