#Dockerfile for running Jekyll on Raspberry Pi.
#References: https://danielha.tk/2018/01/13/hosting-jekyll-on-rpi.html, https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile

#Assign base image.
FROM arm32v7/ruby:2.4.2-jessie
MAINTAINER pr1malbyt3s

#Update current packages.
RUN apt-get update \
	&& apt-get install -y \
		node \
		python-pygments \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists

#Install necessary Ruby gems to run Jekyll.
RUN gem install \
	github-pages \
	jekyll \
	jekyll-redirect-from \
	kramdown \
	rdiscount \
	rouge

#Make working directory for Jekyll.
RUN mkdir -p /srv/jekyll

#Assign volume.
VOLUME /srv/jekyll

#Open port for access to Jekyll pages.
EXPOSE 4000

#Assign working directory.	
WORKDIR /srv/jekyll

#Set entry point.
ENTRYPOINT ["jekyll"]
