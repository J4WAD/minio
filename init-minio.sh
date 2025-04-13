#!/bin/bash

# This script creates the necessary bucket in MinIO for PocketBase

# Wait for MinIO to be ready
echo "Waiting for MinIO to be ready..."
until curl -s http://minio:9000/minio/health/live; do
  echo "MinIO not ready yet, waiting..."
  sleep 5
done
echo "MinIO is ready."

# Install MinIO Client
wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc
chmod +x /usr/local/bin/mc

# Configure MinIO Client
mc alias set myminio http://minio:9000 ${MINIO_ROOT_USER} ${MINIO_ROOT_PASSWORD}

# Create bucket if it doesn't exist
if ! mc ls myminio | grep -q pocketbase; then
  echo "Creating pocketbase bucket..."
  mc mb myminio/pocketbase
  echo "Setting bucket policy..."
  mc policy set download myminio/pocketbase
  echo "Bucket created and configured successfully."
else
  echo "Bucket pocketbase already exists."
fi 