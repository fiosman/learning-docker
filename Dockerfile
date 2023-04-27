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

EXPOSE 8080
CMD ["npm", "run", "dev"]

# Testing image
FROM base as test 

ENV NODE_ENV=testing 

CMD ["npm", "run", "test"]

# Production image 
FROM base AS prod

ENV NODE_ENV=production

HEALTHCHECK --interval=30s --timeout=5s \
  CMD curl --fail http://localhost:8080/health || exit 1

CMD ["npm", "run", "start"]
