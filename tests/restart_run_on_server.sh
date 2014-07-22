#/bin/sh
forever stopall
export PORT=3000
export MONGO_URL=mongodb://localhost:27017/meteor-patterns
export METEOR_SETTINGS=$(cat settings.json)
export ROOT_URL=http://localhost
forever start bundle/main.js
