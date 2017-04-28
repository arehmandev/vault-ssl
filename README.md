# Vault-SSL

To run the secure Vault local setup (SSL certs stored in Certs directory):

```
1.Ensure your environment variable is setup as follows
### export VAULT_ADDR='http://example.net:8200'

2. Add example.net as a localhost entry in /etc/hosts

3. docker-compose up (or docker-compose up -d for detached mode)

4. To terminate CTRL + C or (docker-compose kill for detached mode)
```
Commands to run to test the setup:

```
vault init -ca-cert=Certs/ca.pem -client-cert=Certs/web-cert.pem -client-key=Certs/web-key.pem

vault unseal -ca-cert=Certs/ca.pem -client-cert=Certs/web-cert.pem -client-key=Certs/web-key.pem

vault write -ca-cert=Certs/ca.pem -client-cert=Certs/web-cert.pem -client-key=Certs/web-key.pem secret/foo user=abdul master=me

vault read -ca-cert=Certs/ca.pem -client-cert=Certs/web-cert.pem -client-key=Certs/web-key.pem secret/foo
```

## Notes

SSL certs were generated via cfssl (instructions in generate-certs.sh in Certs/cfssl folder)
For more info: https://coreos.com/os/docs/latest/generate-self-signed-certificates.html
