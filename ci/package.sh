#!/usr/bin/env sh

set -e

cd chaos-lemur

./mvnw clean package

cp manifest.* ../chaos-lemur-deploy
if [ -f ci/env.yml ]; then sed '/^---$/d' ci/env.yml >> ../chaos-lemur-deploy/manifest.yml; fi

cp -r target ../chaos-lemur-deploy
