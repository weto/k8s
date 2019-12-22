#!/bin/bash
echo "####### Iniciando comandos #########"
camando1=`echo br_netfilter >> /etc/modules-load.d/k8s.conf`
camando2=`echo ip_vs_rr >> /etc/modules-load.d/k8s.conf`
camando3=`echo ip_vs_wrr >> /etc/modules-load.d/k8s.conf`
camando3=`echo ip_vs_sh >> /etc/modules-load.d/k8s.conf`
camando5=`echo nf_conntrack_ipv4 >> /etc/modules-load.d/k8s.conf`
camando6=`echo ip_vs >> /etc/modules-load.d/k8s.conf`

updateRaspberry=`apt-get update -y && apt-get upgrade -y`
echo "############### Atualizando ##################"
echo "$updateRaspberry"

instalandoKubernetes=`curl -fsSL https://get.docker.com | bash`
echo "########### Instalando Kubernetes ############"
echo "$instalandoKubernetes"

addCamadaTransporte=`apt-get update && apt-get install -y apt-transport-https`
echo "##### Adicionando camada de transporte #######"
echo "$addCamadaTransporte"

addComponentGoogle=`curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -`
echo "##### Adicionando Componente do Google #######"
echo "$addComponentGoogle"

addDependencia=`echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list`
echo "####### Adicionando nova dependência #########"
echo "$addDependencia"

updateSO=`apt-get update`
echo "########## Atualizando o Raspberry ###########"
echo "$updateSO"
