#!/bin/bash
os="debian"

function docker {
        clear
        echo "#######################"
        echo "##Installation Docker##"
        echo "#######################"
        echo ""
        echo "Ajout des dépendances"
        sudo apt-get update
        sudo apt-get install -y \
                ca-certificates \
                curl \
                gnupg \
                lsb-release
        echo "Installation de docker"
        sudo mkdir -m 0755 -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/$os/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        echo \
                "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$os \
                $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

        sudo chmod a+r /etc/apt/keyrings/docker.gpg
        sudo apt-get update
        sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        clear
        echo "Test de l'installation"
        sudo docker run hello-world
        echo "########################"
        echo "##Installation Terminé##"
        echo "########################"
}

read -p "Voulez vous installer docker? (Y/N) : " rep
case $rep in
Y|y)
docker;;
*)
echo "EXIT";;
esac