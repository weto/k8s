#!/bin/bash
echo "######### Script para iniciar o K8S ###########"

echo "############## Atualizando HOST ###############"
update=`apt-get update`
echo "$update"

echo "########### Iniciando Kubernetes ##############"
systemctl daemon-reload
systemctl restart kubelet
systemctl restart docker

echo "############ Desabilitando Swap ###############"
swapoff -a
echo "####### Kubernetes iniciado. ######"
