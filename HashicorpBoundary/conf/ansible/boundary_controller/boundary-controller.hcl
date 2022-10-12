# Disable memory lock: https://www.man7.org/linux/man-pages/man2/mlock.2.html
disable_mlock = {{ disable_mlock }}

##################################################################################################
# Boudnary controller
##################################################################################################
controller {
  name = "{{ base_domain | replace('.','-') }}-controller"
  description = "{{ base_domain }} Boundary controller"
  database {
    url = "postgresql://{{ postgres_username }}:{{ postgres_password }}@127.0.0.1:5432/{{ postgres_dbname }}"
  }
}

##################################################################################################
# Boudnary listeners
##################################################################################################
# API listener configuration block
listener "tcp" {
  # Should be the address of the NIC that the controller server will be reached on
  address = "0.0.0.0"
  # The purpose of this listener block
  purpose = "api"

  tls_disable = {{ tls_disable }}
  tls_cert_file = "/etc/boundary/ssl/controller01-boundary-{{ base_domain | replace('.','-') }}.crt"
  tls_key_file  = "/etc/boundary/ssl/controller01-boundary-{{ base_domain | replace('.','-') }}.key"

  # Uncomment to enable CORS for the Admin UI. Be sure to set the allowed origin(s)
  # to appropriate values.
  #cors_enabled = true
  #cors_allowed_origins = ["https://yourcorp.yourdomain.com", "serve://boundary"]
}

# Data-plane listener configuration block (used for worker coordination)
listener "tcp" {
  # Should be the IP of the NIC that the worker will connect on
  address = "127.0.0.1"
  # The purpose of this listener
  purpose = "cluster"

  tls_disable = {{ tls_disable }}
  tls_cert_file = "/etc/boundary/ssl/controller01-boundary-{{ base_domain | replace('.','-') }}.crt"
  tls_key_file  = "/etc/boundary/ssl/controller01-boundary-{{ base_domain | replace('.','-') }}.key"
  tls_client_ca_file = "/etc/boundary/ssl/boundary-{{ base_domain | replace('.','-') }}-pki-int.crt"
}


##################################################################################################
# Boudnary KMS
##################################################################################################
kms "transit" {
  purpose            = "root"
  address            = "{{ vault_addr }}"
  token              = "{{ vault_kms_root_token }}"
  disable_renewal    = "false"

  // Key configuration
  key_name           = "boundary-root-key"
  mount_path         = "{{ vault_kms_mount_path }}"
  namespace          = "keys/"

  // TLS Configuration
  tls_ca_cert        = "/etc/ssl/certs/{{ base_domain | replace('.','-') }}-root-ca.crt"
  tls_server_name    = "{{ vault_addr.rpartition('//')[-1].partition('/')[0].partition(':')[0] }}"
  tls_skip_verify    = "false"
}

kms "transit" {
  purpose            = "worker-auth"
  address            = "{{ vault_addr }}"
  token              = "{{ vault_kms_worker_token }}"
  disable_renewal    = "false"

  // Key configuration
  key_name           = "boundary-worker-key"
  mount_path         = "{{ vault_kms_mount_path }}"
  namespace          = "keys/"

  // TLS Configuration
  tls_ca_cert        = "/etc/ssl/certs/{{ base_domain | replace('.','-') }}-root-ca.crt"
  tls_server_name    = "{{ vault_addr.rpartition('//')[-1].partition('/')[0].partition(':')[0] }}"
  tls_skip_verify    = "false"
}

kms "transit" {
  purpose            = "recovery"
  address            = "{{ vault_addr }}"
  token              = "{{ vault_kms_recovery_token }}"
  disable_renewal    = "false"

  // Key configuration
  key_name           = "boundary-recovery-key"
  mount_path         = "{{ vault_kms_mount_path }}"
  namespace          = "keys/"

  // TLS Configuration
  tls_ca_cert        = "/etc/ssl/certs/{{ base_domain | replace('.','-') }}-root-ca.crt"
  tls_server_name    = "{{ vault_addr.rpartition('//')[-1].partition('/')[0].partition(':')[0] }}"
  tls_skip_verify    = "false"
}
