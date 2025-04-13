# PocketBase with MinIO Storage on Render

This repository contains configuration for running PocketBase with MinIO object storage on Render.

## Setup Instructions

1. Create a new MinIO instance (you can use Render's managed MinIO service or any other provider)

2. Set up the following environment variables in your Render dashboard:
   - `MINIO_ROOT_USER`: Your MinIO access key
   - `MINIO_ROOT_PASSWORD`: Your MinIO secret key
   - `MINIO_ENDPOINT`: Your MinIO server endpoint
   - `MINIO_PORT`: MinIO server port (default: 9000)
   - `MINIO_USE_SSL`: Whether to use SSL (default: true)
   - `MINIO_BUCKET`: Bucket name for file storage (default: pocketbase-uploads)

3. Deploy to Render:
   - Fork this repository
   - Create a new Web Service in Render
   - Connect your forked repository
   - Render will automatically detect the configuration and deploy the service

## Configuration

The service uses the following components:
- PocketBase v0.19.4
- MinIO for S3-compatible object storage
- Docker for containerization

## Environment Variables

Make sure to set these environment variables in your Render dashboard:
- `MINIO_ROOT_USER`
- `MINIO_ROOT_PASSWORD`
- `MINIO_ENDPOINT`

Optional variables (with defaults):
- `MINIO_PORT` (default: 9000)
- `MINIO_USE_SSL` (default: true)
- `MINIO_BUCKET` (default: pocketbase-uploads)

## Development

To run locally:

1. Install Docker
2. Build the image:
   ```bash
   docker build -t pocketbase-minio .
   ```
3. Run the container:
   ```bash
   docker run -p 8090:8090 \
     -e MINIO_ROOT_USER=your_access_key \
     -e MINIO_ROOT_PASSWORD=your_secret_key \
     -e MINIO_ENDPOINT=your_endpoint \
     pocketbase-minio
   ```

The PocketBase Admin UI will be available at `http://localhost:8090/_/` 