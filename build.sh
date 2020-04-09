#!/bin/bash
docker build -t rlandj/qq:office -f office/Dockerfile .
docker build -t rlandj/qq:im -f im/Dockerfile .
docker build -t rlandj/qq:light -t bestwu/qq -f im.light/Dockerfile .
docker build -t rlandj/qq:eim -f eim/Dockerfile .
