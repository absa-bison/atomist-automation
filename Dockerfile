FROM node:8

# Must have packages
# RUN apt-get update && apt-get install -y vim nano zsh curl git sudo

# Create application directory
RUN mkdir -p /app
WORKDIR /app
RUN whoami

# Install application dependencies
COPY package.json /app/
RUN npm install

# Bundle app source
COPY . /app

ENV SUPPRESS_NO_CONFIG_WARNING true
ENV NPM_CONFIG_LOGLEVEL warn
ENV NODE_ENV production

EXPOSE 2866

CMD [ "npm", "start" ]

