#Imagen a usar
FROM node:lts-alpine

#Etiquetado
LABEL maintainer="a@a.es"
LABEL project="Entrega módulo contenedores"

ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["server.js", "package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .

#Puerto usado por el contenedor
EXPOSE 3000
RUN chown -R node /usr/src/app
USER node
CMD ["node", "server.js"]
