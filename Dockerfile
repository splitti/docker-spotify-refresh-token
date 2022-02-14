FROM debian

WORKDIR /docker-spotify-refresh-token-main
RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash
RUN sudo apt-get install -y nodejs
RUN cd /tmp; wget https://github.com/splitti/docker-spotify-refresh-token/archive/refs/heads/main.zip; unzip -d / main.zip; rm main.zip
RUN cd /docker-spotify-refresh-token-main
RUN npm install 
RUN npm run build
RUN npm install -g serve
RUN serve -s build &

VOLUME  /docker-spotify-refresh-token-main
EXPOSE 8888
EXPOSE 3000
