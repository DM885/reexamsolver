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
    echo "var 1..100:c;" \
    echo "constraint 250*b + 200*c <= 4000" \  
    echo "constraint 75*b + 150*c <= 500" \ 
    echo "constraint 2*b <= 6 ;" \
    echo "solve maximize 400*b + 450*c;" \ 
    echo "output ["no. of banana cakes = \b\n","no. of choclate cakes =\c\n"];"
    
# If you are building your code for production
RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD ["npm", "run", "start"]