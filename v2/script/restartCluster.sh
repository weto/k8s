#!/bin/bash
#desabilitando swap
flannelInstall=`swapoff -a`

#reiniciando cluster
systemctl daemon-reload
systemctl restart kubelet.service
