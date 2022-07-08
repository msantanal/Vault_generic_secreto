secreto genérico
data "vault_generic_secret" "rundeck_auth" {
  path = "secret/rundeck_auth"
}

# Rundeck Provider, for example
# For this example, in Vault there is a key named "auth_token" and the value is the token we need to keep secret.
# In general usage, replace "auth_token" with the key you wish to extract from Vault. 

provider "rundeck" {
  url        = "http://rundeck.example.com/"
  auth_token = data.vault_generic_secret.rundeck_auth.data["auth_token"]
}
KV
Para este ejemplo, considere examplecomo una ruta para un motor KV.

data "vault_generic_secret" "example_creds" {
  path = "example/creds"
}

data "template_file" "example_template" {
  template = file("./example.tmpl")
  vars = {
    username = data.vault_generic_secret.example_creds.data["username"]
    password = data.vault_generic_secret.example_creds.data["password"]
  }
}
