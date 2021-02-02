FROM node:alpine
WORKDIR '/usr/app'
COPY package.json .
RUN npm install
RUN npm install -g npm@7.5.0
COPY . .
RUN npm run build
FROM nginx
COPY --from=0 /usr/app/build /usr/share/nginx/html