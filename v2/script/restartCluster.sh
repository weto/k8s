#!/bin/bash
#desabilitando swap
swapoff -a

#reiniciando cluster
systemctl daemon-reload
systemctl restart kubelet.service
