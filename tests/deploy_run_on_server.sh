#!/bin/sh
forever stopall
rm -rf bundle_old
mv bundle bundle_old
tar -xvzf app.tgz
pushd bundle/programs/server/node_modules
rm -rf fibers bcrypt
npm install fibers@1.0.1 bcrypt@0.7.7
popd
export PORT=3000
export MONGO_URL=mongodb://localhost:27017/meteor-pattern
export METEOR_SETTINGS=$(cat settings.json)
export ROOT_URL=http://localhost
forever start bundle/main.js
