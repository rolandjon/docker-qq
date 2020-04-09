#!/bin/bash
docker build -t rolandjon/qq:office -f office/Dockerfile .
docker build -t rolandjon/qq:im -f im/Dockerfile .
docker build -t rolandjon/qq:light -t bestwu/qq -f im.light/Dockerfile .
docker build -t rolandjon/qq:eim -f eim/Dockerfile .
