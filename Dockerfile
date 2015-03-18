FROM ubuntu:14.10
MAINTAINER Stephen J. Mason <hi@stephenmason.me>

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y docker.io
RUN wget -O- https://www.opscode.com/chef/install.sh | bash -s -- -P chefdk
RUN locale-gen en_GB

# GEMS
RUN chef gem install kitchen-docker

# Working DIR
WORKDIR /kitchen
