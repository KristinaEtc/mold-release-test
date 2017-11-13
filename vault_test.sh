#!/bin/bash

# Note: check +x mode or vault won't write values 

# Enter your token here
export GITHUB_TOKEN=""

# Run vault in dev mode
vault server -dev & 
export VAULT_ADDR='http://127.0.0.1:8200' 

# Dev to keep Github token/secret in vault
echo "{           
   \"environment_conf\": [
      {
         \"image\": \"golang:1.8.1\",
         \"environment\": [
            \"GITHUB_TOKEN=$GITHUB_TOKEN\"
         ]
      }
   ]
}" | vault write secret/mold_env -

# Jenkins "Build Project" to read from vault and write to a local mold.env file
vault read -format=json secret/mold_env | jq -r .data > .mold.env

# Run program with private repos
$GOPATH/bin/mold