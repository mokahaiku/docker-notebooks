#!/bin/bash

if [ $# -ne 2 ]; then
   echo "Wrong number of parameters passed."
   exit 1
fi

if [ $1 != "-t" ]; then
    echo "Missing parameter -t."
    exit 1
fi

while getopts ":t:" option; do
    case "${option}" in
        t) TAG=${OPTARG};;
    esac
done

docker build -f $TAG.Dockerfile -t tribeofai/docker-notebooks:$TAG .
docker push tribeofai/docker-notebooks:$TAG
