#!/bin/bash
update=`apt-get update`
proxy=`ufw disable`
iniciandoDisco=`systemctl daemon-reload`
desabilitandoSwap=`swapoff -a`
iniciandoK8s=`systemctl restart kubelet`
echo "######## Iniciando script #######"
echo "##### Atualizando Raspberry #####"
echo "$update"
echo "###### desabilitando Proxy ######"
echo "$proxy"
echo "######## Iniciando Disco ########"
echo "$iniciandoDisco"
echo "####### DesabilitandoSwap #######"
echo "$desabilitandoSwap"
echo "##### Iniciando kubernetes ######"
echo "$iniciandoK8s"
echo "####### Finalizado script. ######"
