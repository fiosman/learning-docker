#!/bin/bash

# Stop and remove any existing container with the same name
docker stop learndocker && docker rm learndocker

# Build the Docker image
docker build -t learndocker .

# Run the Docker container
docker run -d --name learndocker -p 8080:8080 learndocker