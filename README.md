# ngrok.service

Automatic ngrok systemd service creation / configuration.

![demo](https://s3.eu-west-3.amazonaws.com/juke-github/compressed-demo.gif)

## Usage
```bash
$ git clone https://github.com/jukefr/ngrok-service.git ~/ngrok-service
$ cd ~/ngrok-service
$ ./setup.sh 
# and follow the instructions 
```

## Explanations
This script does the following :
1. It shows a list of the stable releases of ngrok for every platform.
2. You select the appropriate one for your architecture.
3. It downloads the zip archive.
4. It extracts it, removes the archive.
5. It moves ngrok to /opt/ngrok.
6. You input your ngrok authentication token.
7. It places it on the first line of the ngrok.yml configuration file.
8. It creates two symbolic links :
    * /etc/systemd/system/ngrok.service
    * /opt/ngrok/ngrok.yml
9. It starts and enables the ngrok systemd service.

## Credits
Special thanks to vincenthsu/systemd-ngrok as this project is originally a fork of it.
