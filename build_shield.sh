#!/bin/bash
set -e

echo "${SB_SRC_PATH}"
if [ -z "$SB_SRC_PATH" ] 
then
    echo "Please define SB_SRC_PATH to the local SB repo path. but it in ~/.bashrc e.g. export SB_SRC_PATH=/home/ionut/shield/SB "
    exit 1
fi

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH


AN_PATH_JS="$SB_SRC_PATH/Containers/Docker/shield-icap/AccessNowSrc/lib/rrweb.js"
AN_PATH_CSS="$SB_SRC_PATH/Containers/Docker/shield-icap/AccessNowSrc/css/rrweb.min.css"
CEF_PATH_JS="$SB_SRC_PATH/Containers/Docker/shield-cef/src/rrweb-record.js"

npm run bundle


cp dist/rrweb.js $AN_PATH_JS
cp dist/rrweb.min.css $AN_PATH_CSS
cp dist/record/rrweb-record.js $CEF_PATH_JS

