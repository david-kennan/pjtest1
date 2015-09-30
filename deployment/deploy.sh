#!/bin/bash

SSH_TARGET=ubuntu@192.241.200.139

if [ -z `ls | grep deployment` ]
then
    echo "Please run from the root project directory"
    exit 1;
fi

echo "Deploying Pikjoy, quick and dirty"

rsync -aP * ${SSH_TARGET}:/var/www/pikjoy/.
ssh ${SSH_TARGET} "sudo service uwsgi restart && sudo service nginx restart"

echo "Deployed Pikjoy"