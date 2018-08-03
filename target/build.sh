#!/bin/bash
docker build -t "chef_target" .
docker tag chef_target $1/chef_target
