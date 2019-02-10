#Dockerfile for running Jekyll on Raspberry Pi.

#Assign base image.
FROM arm32v7/ruby:2.4.2-jessie
MAINTAINER pr1malbyt3s

#Update current packages.
RUN apt-get update

#Install necessary Ruby gems to run Jekyll.
RUN gem install \
	bundler \
	github-pages \
	jekyll \
	jekyll-redirect-from \
	kramdown \
	rake \
	rdiscount \
	rouge

#Create user jekyll.
RUN groupadd -g 1000 jekyll && \
	useradd -d /home/jekyll -m -g jekyll -u 1000 jekyll

#Make working directory for Jekyll and give jekyll user sudo privileges.
RUN mkdir -p /srv/jekyll && \
	chown jekyll:jekyll /srv/jekyll && \
	echo 'jekyll ALL=NOPASSWD:ALL' >> /etc/sudoers
	
#Assign working directory.	
WORKDIR /srv/jekyll

#Open port for access to Jekyll pages.
EXPOSE 4000
