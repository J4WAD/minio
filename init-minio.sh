#!/bin/bash

# This script creates buckets in MinIO

# Usage: ./init-minio.sh bucket1 bucket2 bucket3
# If no buckets are provided, it will create a default bucket called "data"

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

# Create buckets
if [ $# -eq 0 ]; then
  # No bucket names provided, create default bucket
  BUCKETS=("data")
else
  # Use provided bucket names
  BUCKETS=("$@")
fi

for bucket in "${BUCKETS[@]}"; do
  if ! mc ls myminio | grep -q ${bucket}; then
    echo "Creating ${bucket} bucket..."
    mc mb myminio/${bucket}
    echo "Setting bucket policy to download (read-only)..."
    mc policy set download myminio/${bucket}
    echo "Bucket ${bucket} created and configured successfully."
  else
    echo "Bucket ${bucket} already exists."
  fi
done 