#!/bin/sh

npm cache clean -f;
npm install -g n;
n lts;

NODE_LTS_V=$(n --lts);

ln -f /usr/local/n/versions/node/"$NODE_LTS_V"/bin/node /usr/bin/node
