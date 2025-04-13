# PocketBase with MinIO S3 Storage

This project sets up a PocketBase instance that uses MinIO as an S3-compatible object storage solution, deployable on Render.

## Local Development

### Prerequisites
- Docker and Docker Compose

### Setup

1. Clone this repository:
```
git clone <repository-url>
cd <repository-name>
```

2. Start the services:
```
docker-compose up -d
```

3. Access services:
   - PocketBase Admin: http://localhost:8080/_/
   - MinIO Console: http://localhost:9001/

## Deployment on Render

### Prerequisites
- A Render account
- Git repository connected to Render

### Deployment Steps

1. Push this code to your Git repository
2. In Render dashboard, select "Blueprint" and connect your repository
3. Render will automatically detect the `render.yaml` file and set up the services
4. Set up environment variables for MinIO in the Render dashboard:
   - `MINIO_ROOT_USER`: Your MinIO username
   - `MINIO_ROOT_PASSWORD`: Your MinIO password
   - `S3_ACCESS_KEY`: Same as MINIO_ROOT_USER
   - `S3_SECRET_KEY`: Same as MINIO_ROOT_PASSWORD

## Configuration

### Environment Variables

- `S3_ENDPOINT`: The MinIO server endpoint (auto-configured on Render)
- `S3_BUCKET`: The bucket name for file storage (default: `pocketbase`)
- `S3_REGION`: The S3 region (default: `us-east-1`)
- `S3_ACCESS_KEY`: The MinIO access key
- `S3_SECRET_KEY`: The MinIO secret key

## Structure

- `docker-compose.yml`: Local development setup
- `render.yaml`: Render deployment configuration
- `Dockerfile` & `Dockerfile.minio`: Container configurations
- `pb_hooks/main.pb.js`: PocketBase hook to configure S3 storage
- `init-minio.sh`: Script to initialize the MinIO bucket 