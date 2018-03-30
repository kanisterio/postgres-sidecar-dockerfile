#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

pushd /kanister

echo "================= Adding some global settings ==================="
mv gbl_env.sh /etc/profile.d/
mkdir -p ${HOME}/.ssh/
mv config ${HOME}/.ssh/
mv 90forceyes /etc/apt/apt.conf.d/

echo "================= Installing basic packages ==================="
apt-get update
apt-get install curl wget groff lzop pv postgresql-client

echo "================= Installing Python packages ==================="
apt-get install python3-pip
pip3 install --upgrade pip
pip3 install wal-e[aws]
pip3 install awscli

echo "================= Cleaning package lists ==================="
apt-get clean
apt-get autoclean
apt-get autoremove
