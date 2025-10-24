# using node image from alpine distribution of linux
FROM node:alpine

# using '.' will copy all the files to a new directory called /app in docker image file system
COPY . /app

# To know we are inside of app directory and we dont need to prefix the below commands with /app/app.js for example
WORKDIR /app

# copy package.json before the rest (better caching)
COPY package*.json ./

# install dependencies
RUN npm install

# expose port
EXPOSE 3000

# CMD run a command, here is the command to node run our app
# run the app
CMD ["node", "app.js"]

