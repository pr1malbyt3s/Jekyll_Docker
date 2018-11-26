#!/bin/bash

#Set color variables.
GREEN='\033[0;32m'
NC='\033[0m'

#Ensure container not already running.
echo -e "${GREEN}Ensuring Jekyll container not already running.${NC}"
docker stop jekyll_jungle > /dev/null 2>&1
sleep 2
docker rm jekyll_jungle > /dev/null 2>&1

#Ask user where they want to create directory for files.

#Ask user who they want to own the files.

#Make volume directory for hosting.
echo -e "${GREEN}Creating volume for file hosting.${NC}"
rm -rf /home/al33w6/test2
mkdir /home/al33w6/test2
cd /home/al33w6/test2
chown -R al33w6:al33w6 /home/al33w6/test2

#Initialize Jekyll container. Bind localhost port to docker port and give time for startup.
echo -e "${GREEN}Starting Jekyll container.${NC}"
docker run --rm -v $PWD:/srv/jekyll -it jekyll/jekyll jekyll new .
sleep 3
docker run --rm -v $PWD:/srv/jekyll -it jekyll/jekyll jekyll build
sleep 3
docker run --name jekyll_jungle -v $PWD:/srv/jekyll -d -p 127.0.0.1:4443:4000 jekyll/jekyll jekyll serve --watch
sleep 3

#docker exec -it jekyll_jungle /bin/bash -c "jekyll new ."
#sleep 3
#docker exec -it jekyll_jungle /bin/bash -c "jekyll serve"
