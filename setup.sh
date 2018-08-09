#!/bin/bash
# prettiest script I probably ever wrote :3

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

function ng_main() {
 for i in ${targets[*]}
 do
    if [[ $i = *"$1"* ]]; then
      link=$(echo "$i" | grep "$1")
    fi 
 done 
 printf "\nDownloading ngrok.zip..."
 curl -s -o ngrok.zip "$link"
 printf "\nUnzipping ngrok.zip..." 
 unzip ./ngrok.zip > /dev/null
 printf "\nRemoving ngrok.zip..." 
 rm ./ngrok.zip
 printf "\nMoving to /opt/ngrok...\n"
 sudo mkdir -p /opt/ngrok
 sudo mv ngrok /opt/ngrok
 read -p 'Auth Token: ' token
 token_text="authtoken: $token"
 sed -i "1s/.*/$token_text/" ./ngrok.yml
 printf "Creating symbolic links..."
 sudo ln -s "$PWD/ngrok.service" /etc/systemd/system/ngrok.service &> /dev/null
 sudo ln -s "$PWD/ngrok.yml" /opt/ngrok/ngrok.yml &> /dev/null
 printf "\nEnabling system service..."
 sudo systemctl daemon-reload > /dev/null
 sudo systemctl enable ngrok.service > /dev/null
 sudo systemctl start ngrok.service  > /dev/null

 printf "${green}\n\nAll done!${reset} You can start adding your services in ${red}./ngrok.yml${reset}\n"
 exit 0 
}

# Fetch download link
targets=($(curl -s https://ngrok.com/download | grep -Eo "(http|https)://bin\.equinox\.io[a-zA-Z0-9./?=_-]*"))
short_targets=($(curl -s https://ngrok.com/download | grep -Eo "(http|https)://bin\.equinox\.io[a-zA-Z0-9./?=_-]*" | grep -Eo "([^\/]+\$)"))

printf "\nSelect the right version for your OS (${red}hint${reset}: uname -m says '${green}$(uname -m)${reset}')\n"
select opt in "${short_targets[@]}"
do
    case $opt in
        *.zip)
            printf "\nSelected : ${green}$opt${reset}"
	    ng_main $opt
            ;;
        *) echo "Invalid $REPLY";;
    esac
done
