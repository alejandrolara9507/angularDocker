# base image
FROM node:11.9.0

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add .bin to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install package.json (las dependencies)
COPY package.json /usr/src/app/package.json
RUN npm install

# Instalamos angular cli en nuestra imágen
RUN npm install -g @angular/cli && npm cache clean

# Puerto entorno dev
EXPOSE 4200
# Puerto livereload
EXPOSE 49153
# Puerto Test
EXPOSE 9876
# Puerto e2e
EXPOSE 49152

# add app
COPY . /usr/src/app

# start app
CMD ng serve --host 0.0.0.0
