#!/bin/bash
proxy=`ufw disable`
iniciandoDisco=`systemctl daemon-reload`
desabilitandoSwap=`swapoff -a`
iniciandoK8s=`systemctl restart kubelet`
echo "$proxy && $iniciandoDisco && $desabilitandoSwap && $iniciandoK8s"
echo "Inicializando Serviços"
