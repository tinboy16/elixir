#!/bin/bash

# Pull the latest image
echo "Pulling the latest elixirprotocol/validator:v3 image..."
docker pull elixirprotocol/validator:v3

# Stop and remove the existing container if it's running
if [ "$(docker ps -q -f name=elixir)" ]; then
    echo "Stopping existing Elixir container..."
    docker stop elixir
    echo "Removing existing Elixir container..."
    docker rm elixir
fi

# Run the new container
echo "Running the new Elixir container..."
docker run -d --env-file .env --name elixir --restart unless-stopped -p 17690:17690 elixirprotocol/validator:v3

echo "Elixir Validator is running!"
