FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required software
RUN apt-get update && \
    apt-get install -y blender

# RUN apt-get install -y wget unzip

ARG USER=crownlabs
ARG UID=1010

ENV DISPLAY=:0 \
    USER=${USER} \
    HOME=/home/$USER

# Create new user and set a set a valid shell for them
RUN useradd -ms /bin/bash -u ${UID} $USER

# Download demo and clean up
# RUN wget https://download.blender.org/demo/test/splash_fishy_cat_2.zip -O $HOME/splash_fishy_cat_2.zip && \
#     cd && \
#     unzip splash_fishy_cat_2.zip && \
#     rm -rf splash_fishy_cat_2.zip && \
#     rm -rf __MACOSX

COPY rubinetto.blend $HOME

RUN chown -R $USER:$USER $HOME

USER $USER

# CMD blender ${HOME}/blender_splash_fishy_cat/fishy_cat.blend
CMD blender ${HOME}/rubinetto.blend