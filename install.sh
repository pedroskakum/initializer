# Visual estudio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https --yes
sudo apt update --yes
sudo apt install code --yes # or code-insiders

# Install Extensions
code --install-extension googlecloudtools.cloudcode
code --install-extension ms-azuretools.vscode-docker
code --install-extension fatihacet.gitlab-workflow
code --install-extension orta.vscode-jest
code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension octref.vetur
code --install-extension vscode-icons-team.vscode-icons

# Visual Studio Config
sudo cp --force vscode-settings.json > ~/.config/Code/User/

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update --yes
sudo apt install google-chrome-stable --yes

# Virtual Box
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian disco non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list' 
sudo apt update --yes
sudo apt install virtualbox-6.0 --yes

# Git
sudo apt install git --yes
git config --global user.email "pedroskakum@gmail.com"
git config --global user.name "Pedro Paulo Skakum"

# Curl
sudo apt install curl --yes

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Kubectl
sudo apt update --yes
sudo apt install --yes apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update --yes
sudo apt install --yes kubectl

# Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin
sudo rm minikube

# Skaffold
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x skaffold
sudo mv skaffold /usr/local/bin

# Fish
sudo apt-add-repository ppa:fish-shell/release-3 --yes
sudo apt update --yes
sudo apt install fish --yes

# Oh My Fish
curl -L https://get.oh-my.fish | fish

# Fonts
# sudo apt install ttf-mscorefonts-installer --yes
sudo apt-get install fonts-powerline --yes

# Install Agnoster theme
omf install agnoster
bash

# Gogh Themes for Terminal (Terminal Compatible only)
echo "ALL" | bash -c  "$(wget -qO- https://git.io/vQgMr)" 

# Docker
sudo apt install ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce --yes
sudo usermod -aG docker ${USER} # (for run docker without sudo)


