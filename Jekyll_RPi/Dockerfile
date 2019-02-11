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

#Create user jekyll.
RUN groupadd -g 1000 jekyll && \
	useradd -d /home/jekyll -m -g jekyll -u 1000 jekyll && \
	echo 'jekyll ALL=NOPASSWD:ALL' >> /etc/sudoers

#Make working directory for Jekyll and give jekyll user sudo privileges.
RUN mkdir -p /srv/jekyll && \
	chown jekyll:jekyll /srv/jekyll

#Assign volume.
VOLUME /srv/jekyll

#Open port for access to Jekyll pages.
EXPOSE 4000

#Assign working directory.	
WORKDIR /srv/jekyll

#Switch to user jekyll.
USER jekyll

#Set entry point.
ENTRYPOINT ["jekyll"]
