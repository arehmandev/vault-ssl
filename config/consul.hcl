#storage "consul" {
#  address = "consul:8500"
#  path = "demo_vault"
#  advertise_addr = "https://127.0.0.1"
#  tls_cert_file = "/Certs/primary.pem"
#  tls_key_file =  "/Certs/web-key.pem"
#}

listener "tcp" {
 address = "0.0.0.0:8200"
 tls_cert_file = "/Certs/primary.pem"
 tls_key_file =  "/Certs/web-key.pem"
}

disable_mlock = true
