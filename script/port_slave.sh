#!/bin/bash
firewall=`ufw enable -y`
echo "$firewall"

for i  in  32767 6784 80 8080 22 10255 6783 10250 30000; do
    echo `ufw allow $i`
done

