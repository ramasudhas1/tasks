#!/bin/bash
#
#
apt install docker.io -y

systemctl start docker
systemctl enable docker
