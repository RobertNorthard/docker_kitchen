FROM ubuntu:14.10
MAINTAINER Stephen J. Mason <hi@stephenmason.me>

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y docker.io
RUN apt-get install -y git
RUN wget -O- https://www.opscode.com/chef/install.sh | bash -s -- -P chefdk
RUN locale-gen en_GB

WORKDIR /tmp

# Kitchen-Docker GEM
RUN chef gem install kitchen-docker

# Kitchen-EC2 GEM
RUN chef gem install kitchen-ec2

# Working DIR
WORKDIR /kitchen
