# Grab base image for Node (v16)
FROM node:16-alpine AS base

# Set the working directory inside the container
WORKDIR /app 

# Copy the package.json file and install dependencies
COPY package.json .
RUN npm install 

# Copy the rest of the application code
COPY . .

# Development image 
FROM base AS dev 

ENV NODE_ENV=development

EXPOSE 3000
CMD ["npm", "run", "dev"]