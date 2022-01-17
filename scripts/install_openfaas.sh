
# Remove older version of Docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# Install Docker on Ubuntu

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release



# OpenFaas CLI
curl -sLSf https://cli.openfaas.com | sudo sh
