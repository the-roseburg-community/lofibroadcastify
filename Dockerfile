# pull official base image
FROM nikolaik/python-nodejs:python3.12-nodejs18-bullseye

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install
RUN npm update --save
RUN npm install --save-dev @babel/plugin-proposal-private-property-in-object


#RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# start app
CMD ["npm", "start"]
