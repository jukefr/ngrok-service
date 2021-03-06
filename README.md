# ngrok.service

### Buy me covfefe ❤️
```
BTC     bc1qjqzkrfupcrgtzpeu0pmut24vq8tfzs9rqe6458
ETH     0x799b3b5520525CDd95d1D5C7Ba1a2Ee6037B1bFE
ADA     addr1q8mz3z7cw4jz9dacvpz6dpw2c6xke6nv8vk6rfnt7mkaat8vgnu796g5vrarn4pjgpdqkare9zryx645e25wcae8636q97typg
XRP     r3Bpcyp8zVNkaDzpppdRTuSXSvxAUJXAVj
LTC     ltc1qpja2nr6x9nz3q3ya3ec6ec5hxvm8dz52urn39z
BCH     1NAteBJF7wKw8BdzLJ6YE65ja1ZAHf68jf
DOGE    DL4VNBx6EGuPcgnJrfgxok9tTvcbVGKx3R
XMR     89S6qYdMJyZZ8ddKtFqTzGhuDZxJkNcmL9L6KzTSw7AeQos1uku2GBhBaHLUYtgv4TQRRQuNF4FixAu6geKC2r25NyWZj2Q
DASH    XtffD9gZFDKWWpabMyAi8sF9EeDREH5dUy
DCR     DsSAqeDekTCvbd84GkAofHyutrFrFDX1EnD
ZEC     t1P336iRRMM6Yu2wTzXJmjm6p4RgNAQkgsM
STRAX   SVfFcCZtQ8yMSMxc2K8xzFr4psHpGpnKNT 
```


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
