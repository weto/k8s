#!/bin/bash

# Resetar o cluster
kubeadm reset

# Parar Docker e Kubelet
systemctl daemon-reload && systemctl stop docker && sudo systemctl stop kubelet

# Apagar diretórios da instalacao anterior
rm -rf /etc/kubernetes/
rm -rf $HOME/.kube
rm -rf /var/lib/kubelet/
rm -rf /var/lib/cni/
rm -rf /etc/cni/
rm -rf /var/lib/etcd/

#reset iptables
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X

# Reiniciar os Containers
systemctl start docker && sudo systemctl start kubelet
