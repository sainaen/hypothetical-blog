#!/usr/bin/env bash

set -e

HUGO_VERSION="0.31.1"
HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-32bit.tar.gz"

wget -O hugo.tar.gz "$HUGO_URL"

tar zxfv hugo.tar.gz hugo
chmod +x hugo

./hugo

git clone --depth=50 --branch=gh-pages https://github.com/sainaen/hypothetical-blog target
mv target/.git public/
cd public

git config user.name "Travis CI"
git config user.email "travis-ci@example.com"

git add --force --all .
git commit -m "Travis CI build $(date +%F)"
