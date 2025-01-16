#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: ./builder.sh <github-repository> <dockerhub-repository> <docker-username> <docker-token>"
    exit 1
fi

# Get the arguments
GITHUB_REPO=$1
DOCKERHUB_REPO=$2
DOCKER_USERNAME=$3
DOCKER_TOKEN=$4

# Clone the GitHub repository
echo "Cloning repository from GitHub: $GITHUB_REPO"
git clone "https://github.com/$GITHUB_REPO.git"

# Extract the repository name from the GitHub repo for the directory name
REPO_NAME=$(basename "$GITHUB_REPO")

# Change directory into the cloned repository
cd "$REPO_NAME" || exit

# Build the Docker image
echo "Building Docker image..."
docker build -t "$DOCKERHUB_REPO:latest" .

# Log in to Docker Hub using the username and token provided as parameters
echo "Logging into Docker Hub..."
echo "$DOCKER_TOKEN" | docker login --username "$DOCKER_USERNAME" --password-stdin

# Push the Docker image to Docker Hub
echo "Pushing Docker image to Docker Hub..."
docker push "$DOCKERHUB_REPO:latest"

# Clean up by removing the cloned repository directory
cd ..
rm -rf "$REPO_NAME"

echo "Script completed successfully!"
