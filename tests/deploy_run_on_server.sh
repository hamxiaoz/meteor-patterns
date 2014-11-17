#!/bin/sh
forever stopall
rm -rf bundle_old
mv bundle bundle_old
tar -xvzf APPNAME.tar.gz

# The following works for Meteor v1.0
pushd bundle/programs/server
npm install
# https://github.com/meteor/meteor/issues/3093
cd npm
rm -rf npm-bcrypt/node_modules/bcrypt
npm install bcrypt@0.7.7
popd

# run
export PORT=3000
export MONGO_URL=mongodb://localhost:27017/meteor-pattern
export METEOR_SETTINGS=$(cat settings.json)
export ROOT_URL=http://localhost
forever start bundle/main.js
