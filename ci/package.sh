#!/usr/bin/env sh

set -e

cd chaos-lemur
./mvnw clean package

cp manifest ../chaos-lemur-deploy
cp -r target ../chaos-lemur-deploy

