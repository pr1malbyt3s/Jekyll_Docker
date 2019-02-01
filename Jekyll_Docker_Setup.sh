#!/bin/bash

#Set color variables.
GREEN='\033[0;32m'
NC='\033[0m'

#Ensure container not already running.
echo -e "${GREEN}Ensuring Jekyll container not already running.${NC}"
docker stop jekyll_jungle &>/dev/null
sleep 2
docker rm jekyll_jungle &>/dev/null

#Ask user where they want to create directory for files.
read -p "$(echo -e ${GREEN}"Please enter the directory to be used for the container volume: "${NC})" vol_path

#Ask user who they want to own the files.
read -p "$(echo -e ${GREEN}"Please enter the user who will own the volume directory: "${NC})" dir_owner

#Make volume directory for hosting.
echo -e "${GREEN}Creating volume for file hosting.${NC}"
rm -rf $vol_path &>/dev/null
mkdir -p $vol_path
cd $vol_path
chown -R $dir_owner:$dir_owner .

#Initialize Jekyll container. Bind localhost port to docker port and give time for startup.
echo -e "${GREEN}Starting Jekyll container.${NC}"
docker run --rm -v $PWD:/srv/jekyll -it jekyll/jekyll jekyll new .
sleep 3

docker run --rm -v $PWD:/srv/jekyll -it jekyll/jekyll jekyll build
sleep 3
docker run --name jekyll_jungle -v $PWD:/srv/jekyll -d -p 127.0.0.1:3000:4000 jekyll/jekyll jekyll serve --watch --drafts
sleep 3

chown -R $dir_owner:$dir_owner .
