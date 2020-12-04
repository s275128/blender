FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required software
RUN apt-get update && \
    apt-get install -y nautilus blender wget

ARG USER=crownlabs
ARG UID=1010

ENV DISPLAY=:0 \
    USER=${USER} \
    HOME=/home/$USER

# Create new user and set a set a valid shell for them
RUN useradd -ms /bin/bash -u ${UID} $USER

RUN wget https://download.blender.org/demo/test/splash_fishy_cat_2.zip -O $HOME/splash_fishy_cat_2.zip

RUN chown -R $USER:$USER $HOME

USER $USER

CMD nautilus $HOME