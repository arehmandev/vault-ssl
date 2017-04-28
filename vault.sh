#!/bin/bash

export VAULT_ADDR="https://example.net:8200"
docker rm -f consul
docker rm -f vault
sleep 3

docker run -d \
     -p 8400:8400 -p 8500:8500 -p 8600:53/udp  \
      --hostname consul \
      --volume $PWD/Certs:/Certs \
      --name consul progrium/consul \
      -server -bootstrap -ui-dir /ui
sleep 3
docker run -d \
     -p 8200:8200 \
     --hostname vault \
     --name vault \
     --link consul:consul \
     --volume $PWD/config:/config \
     --volume $PWD/Certs:/Certs \
     sjourdan/vault server -config=/config/consul.hcl
echo "Now download Vault and run './vault init'"

# Commands to run to init and unseal
# vault init -ca-cert=Certs/ca.pem -client-cert=Certs/web-cert.pem -client-key=Certs/web-key.pem
# vault unseal -ca-cert=Certs/ca.pem -client-cert=Certs/web-cert.pem -client-key=Certs/web-key.pem

# vault write -ca-cert=Certs/ca.pem -client-cert=Certs/web-cert.pem -client-key=Certs/web-key.pem secret/foo user=abdul master=me

# vault read -ca-cert=Certs/ca.pem -client-cert=Certs/web-cert.pem -client-key=Certs/web-key.pem secret/foo
