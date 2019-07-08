FROM node:lts-alpine

RUN apk add --no-cache tini

ENV PORT 8085
EXPOSE ${PORT}

WORKDIR /opt/http-echo

COPY package.json yarn.lock ./
RUN yarn install
CMD ["tini", "yarn", "start"]
