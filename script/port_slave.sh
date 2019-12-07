#!/bin/bash
firewall=`ufw enable`
echo "$firewall"

for i  in  80 8080 6443 22 10251 10255 10250 2379 2380 10252; do
    echo `ufw allow $i`
done

