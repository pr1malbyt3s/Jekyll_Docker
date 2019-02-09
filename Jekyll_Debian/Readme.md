# Jekyll_Docker

This script will generate a docker container (tested for Debian) running Jekyll with the default Minima theme and configurations.  
-To make changes to the configuration and general information fields, update the "_config.yml" file.
-To create a post or edit postings, updat the contents of the "_posts" directory.  
-To change the theme or install plugins, upated the "Gemfile" file with appropriate content and issue the following command to update the container:  
```bash
docker exec -it jekyll_jungle bash -c 'bundle install && bundle update'
```
-After every update, make sure to restart your container to make the updates take effect:
```bash
docker restart jekyll_jungle
```

*Note: if using a reverse proxy to host your site, make sure to include the full site path so that all contents render correctly. For example, if you are port forwarding localhost:4000 to your container on port 4000, the path of your reverse proxy destination should be http://localhost:4000/. The extra "/" on the end is important for rendering!  

