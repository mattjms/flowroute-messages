FROM node:10 as development-stage
RUN apt-get update -qq && \
    apt-get install -y nano build-essential libpq-dev rsync && \
    npm install -g @vue/cli@3.12.0 @vue/cli-service-global@3.12.0 && \
    mkdir -p /home/node/cache/node_modules && \
    chown -R node:node /home/node/cache && \
    mkdir -p /home/node/app/node_modules && \
    chown -R node:node /home/node/app && \
    echo "alias='ls -alF'" >> /home/node/.profile
USER node
WORKDIR /home/node/cache
COPY package*.json ./
RUN npm install
WORKDIR /home/node/app
COPY --chown=node:node . .