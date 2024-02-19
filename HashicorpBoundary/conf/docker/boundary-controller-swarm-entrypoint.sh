#!/bin/ash

set -e

echo "[+] - $(date) - Starting Boundary controller"


################################# Download Vault root CA #################################
echo "[+] - $(date) - Retrieving Vault root CA"
# Get Vault root CA
wget --no-check-certificate ${VAULT_ADDR}/v1/pki/ca/pem -O /boundary/${BASE_DOMAIN//./-}-root-ca.crt && \
    chown root:root /boundary/${BASE_DOMAIN//./-}-root-ca.crt && \
    chmod 644 /boundary/${BASE_DOMAIN//./-}-root-ca.crt

################################# Configure Boundary #################################
echo "[+] - $(date) - Configure Boundary controller"

# Copy config from temp to boundary directory
cp /tmp/boundary-controller.hcl /boundary/controller.hcl

# Set config vaules
sed -i "s#{{ base_domain }}#${BASE_DOMAIN}#g" /boundary/controller.hcl && \
    # Set Controller name
    sed -i "s#name = \".*#name = \"${BASE_DOMAIN}-$(hostname)-controller\"#g" /boundary/controller.hcl && \
    # Set mlock
    sed -i "s#{{ disable_mlock }}#${DISABLE_MLOCK}#g" /boundary/controller.hcl && \
    # Set Postgres URL conenction string
    sed -i "s#url = \"postgresql://.*#url = \"postgresql://${POSTGRES_USER}:$(cat /run/secrets/boundary-postgres-password)@postgres:5432/${POSTGRES_DB}?sslmode=disable\"#g" /boundary/controller.hcl && \
    # Set tls_disable
    sed -i "s#{{ tls_disable }}#${TLS_DISABLE}#g" /boundary/controller.hcl && \
    # Set mem lock
    sed -i "s#{{ disable_mlock }}#${DISABLE_MLOCK}#g" /boundary/controller.hcl && \
    # Set root CA file name
    sed -i "s#tls_ca_cert        = \"/etc/ssl/certs.*#tls_ca_cert        = \"/boundary/${BASE_DOMAIN//./-}-root-ca.crt\"#g" /boundary/controller.hcl && \
    # Set Vault addr
    sed -i "s#{{ vault_addr }}#${VAULT_ADDR}#g" /boundary/controller.hcl && \
    # Set Vault KMS mount path
    sed -i "s#{{ vault_kms_mount_path }}#${VAULT_MOUNT_PATH}#g" /boundary/controller.hcl && \
    # Set Vault KMS tokens
    sed -i "s#{{ vault_kms_root_token }}#$(cat /run/secrets/vault-kms-root-token)#g" /boundary/controller.hcl && \
    sed -i "s#{{ vault_kms_worker_token }}#$(cat /run/secrets/vault-kms-worker-token)#g" /boundary/controller.hcl && \
    sed -i "s#{{ vault_kms_recovery_token }}#$(cat /run/secrets/vault-kms-recovery-token)#g" /boundary/controller.hcl

# Check if Postgres database is empty
echo "[+] - $(date) - Initing Boundary database"
/bin/boundary database init -config /boundary/controller.hcl

# Pass command line arguments to boundary command
echo "[+] - $(date) - Starting Boundary controller"
/bin/boundary server -config /boundary/controller.hcl
