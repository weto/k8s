#!/bin/bash
iniciandoDisco=`systemctl daemon-reload`
desabilitandoSwap=`swapoff -a`
iniciandoK8s=`systemctl restart kubelet`
echo "$iniciandoDisco && $desabilitandoSwap && $iniciandoK8s"
echo "Inicializando Serviços"
