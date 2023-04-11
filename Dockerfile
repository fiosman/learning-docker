# Grab base image for Node (v16)
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app 

# Copy the package.json file and install dependencies
COPY package.json .
RUN npm install 

# Copy the rest of the application code
COPY . .

# Set the command to start the application
CMD ["node", "app.js"]