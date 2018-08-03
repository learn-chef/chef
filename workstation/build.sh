#!/bin/bash
docker build -t "chef_workstation" .
chefrun_ver=$(docker run chef_workstation chef-run --version | awk '{print $2}')
docker tag chef_workstation $1/chef_workstation
docker tag chef_workstation $1/chef_workstation:$chef_ver
