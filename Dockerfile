#####
# Stage 1: Build ionic
#####
FROM node:16 as build

WORKDIR /docker-spotify-refresh-token-main

## Install ionic
RUN npm install -g @ionic/cli

## Install dependencies
RUN cd /tmp; wget https://github.com/splitti/docker-spotify-refresh-token/archive/refs/heads/main.zip; unzip -d / main.zip; rm main.zip
RUN cd /docker-spotify-refresh-token-main
RUN npm install 
# Workaround for missing dependency in package.json
RUN npm run build
RUN npm run dev

VOLUME  /docker-spotify-refresh-token-main
EXPOSE 80

CMD npm start
