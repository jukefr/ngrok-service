#!/bin/sh

if [ ! -f ./*.zip ]; then
    echo "Please grab a copy of ngrok from here first : https://ngrok.com/download"
    exit 1
else
    echo "Unzipping"
    unzip ./*.zip > /dev/null
fi

if [ -z "$1" ]
  then
    echo "ngrok auth key should be passed as first argument"
    exit 1
fi

# Move to /opt/ngrok
sudo mkdir -p /opt/ngrok
sudo mv ngrok /opt/ngrok

# Set token
sed -i -e "s/replaceme/$1/g" ngrok.yml

# Create symbolic links
sudo ln -s "$PWD/ngrok.service" /etc/systemd/system/ngrok.service
sudo ln -s "$PWD/ngrok.yml" /opt/ngrok/ngrok.yml

# Enable Service
sudo systemctl daemon-reload
sudo systemctl enable ngrok.service
sudo systemctl start ngrok.service
