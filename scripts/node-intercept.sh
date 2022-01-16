#! /bin/bash

export HTTP_PROXY="http://localhost:8080"
export HTTPS_PROXY="http://localhost:8080"
export NODE_TLS_REJECT_UNAUTHORIZED="0"    
yarn start:dev
