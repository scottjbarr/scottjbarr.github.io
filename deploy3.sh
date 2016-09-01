#!/bin/bash

git checkout develop

if [ $? -ne 0 ]; then
    exit 1
fi

hugo

rm -rf tmp/public
mv public tmp/

git checkout master

cp -rf tmp/public/* .

git add -A .
git commit -m "Regenerated site"

git push origin master

if [ $? -ne 0 ]; then
    exit 1
fi

git checkout develop
