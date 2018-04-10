#
# Debian Dockerfile
#
#

# Pull base image.
FROM debian:9.4

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get clean

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts
ADD accelerate-docker-setup.sh .

RUN apt install sudo

RUN chmod +x accelerate-docker-setup.sh
RUN ./accelerate-docker-setup.sh

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
