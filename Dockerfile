FROM nginx:1.9.14
RUN rm /etc/nginx/conf.d/default.conf
COPY config/frontend.conf /etc/nginx/conf.d

FROM mhart/alpine-node:10.16.0
WORKDIR /opt/cruise-control-ui
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8090
CMD [ "npm", "run", "dev" ]