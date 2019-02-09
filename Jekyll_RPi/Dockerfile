#Dockerfile for running Jekyll on Raspberry Pi.

#Assign base image.
FROM arm32v7/ruby:2.4.2-jessie
MAINTAINER pr1malbyt3s

#Update current packages.
RUN apt-get update

#Install necessary Ruby gems to run Jekyll.
RUN gem install \
	github-pages \
	jekyll \
	jekyll-redirect-from \
	bundler \
	kramdown \
	rdiscount \
	rouge

#Create user jekyll.
RUN mkdir -p /home/jekyll && \
	addgroup Sg 1000 jekyll && \
	adduser -SG jekyll -u 1000 -h /home/jekyll jekyll && \
	chown jekyll:jekyll /home/jekyll

#Make working directory for Jekyll and give jekyll user sudo privileges.
RUN mkdir -p /srv/jekyll && \
	chown jekyll:jekyll /srv/jekyll && \
	echo 'jekyll ALL=NOPASSWD:ALL' >> /etc/sudoers
	
#Assign working directory.	
WORKDIR /srv/jekyll

#Open port for access to Jekyll pages.
EXPOSE 4000
