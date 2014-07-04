#!/bin/bash

# Replace envvars in varnish configuration files
envs=`printenv`

for env in $envs
do
	IFS== read name value <<< "$env"
	sed -i "s|\${${name}}|${value}|g" /etc/nginx/sites-enabled/default
	sed -i "s|\${${name}}|${value}|g" /etc/nginx/sites-available/default
done
