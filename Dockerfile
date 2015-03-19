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
ENV kitchendockercommit 121d027
RUN git clone https://github.com/stevejmason/kitchen-docker.git
WORKDIR /tmp/kitchen-docker
RUN git checkout ${kitchendockercommit}
RUN chef gem build kitchen-docker.gemspec
RUN chef gem install kitchen-docker*.gem

# Working DIR
WORKDIR /kitchen
