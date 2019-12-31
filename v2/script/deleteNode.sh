#!/bin/bash
nome=$1
kubectl drain $nome --delete-local-data --force --ignore-daemonsets
kubectl delete node $nome
echo "Node $nome removido"
