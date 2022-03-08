FROM node:17.5-alpine3.14
#FROM node:16.3-alpine3.12

# Create app directory main directory #### change main #4
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

#add some text here
RUN mkdir /solvertest
RUN \ 
    echo "var 0..100: b;" \                            
    echo "var 1..100:c;" 
    
# If you are building your code for production
RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD ["npm", "run", "start"]