#!/bin/bash
chefrun_ver=$(docker run chef_workstation chef-run --version | awk '{print $2}')
docker push $1/chef_workstation
docker push $1/chef_workstation:$chefrun_ver
