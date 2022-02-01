
# Remove older version of Docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# Install Docker on Ubuntu

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world



# OpenFaas CLI
curl -sLSf https://cli.openfaas.com | sudo sh
faas-cli help
faas-cli version

# Install Kubectl

export VER=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
curl -LO https://storage.googleapis.com/kubernetes-release/release/$VER/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/

# Install k3d

wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

k3d cluster create mosaic
kubectl get pods --all-namespaces

# Deploy OpenFaaS

curl -SLsf https://dl.get-arkade.dev/ | sudo sh
arkade install openfaas

kubectl -n openfaas get deployments -l "release=openfaas, app=openfaas"                            

# Get the faas-cli
curl -SLsf https://cli.openfaas.com | sudo sh

function trap_ctrlc ()
{
    # perform cleanup here
    echo "Ctrl-C caught...performing clean up"

    echo "Doing cleanup"

    # exit shell script with error code 2
    # if omitted, shell script will continue execution
    exit 2
}

# Forward the gateway to your machine
kubectl rollout status -n openfaas deploy/gateway
kubectl port-forward -n openfaas svc/gateway 8080:8080 &
trap "trap_ctrlc" 2

# If basic auth is enabled, you can now log into your gateway:
PASSWORD=$(kubectl get secret -n openfaas basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 --decode; echo)
echo -n $PASSWORD | faas-cli login --username admin --password-stdin

faas-cli list
faas-cli list -v
faas-cli template pull
faas-cli new --list


