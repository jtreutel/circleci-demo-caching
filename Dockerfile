FROM node:15.7.0
LABEL "maintainer"="github.com/jtreutel"

EXPOSE 3000

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

# fix issue with create-react-apps causing container to exit
ENV CI=true

# install app dependencies
COPY package.json ./

RUN npm install --silent
RUN npm install react-scripts@3.4.3 --silent

COPY . ./

# start app
ENTRYPOINT npm start