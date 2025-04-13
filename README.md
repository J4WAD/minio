# MinIO S3-Compatible Object Storage

This project sets up MinIO as an S3-compatible object storage solution, deployable on Render.

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

3. Access MinIO:
   - MinIO API: http://localhost:9000/
   - MinIO Console: http://localhost:9001/

## Deployment on Render

### Prerequisites
- A Render account
- Git repository connected to Render

### Deployment Steps

1. Push this code to your Git repository
2. In Render dashboard, select "Blueprint" and connect your repository
3. Render will automatically detect the `render.yaml` file and set up the MinIO service
4. Set up environment variables for MinIO in the Render dashboard:
   - `MINIO_ROOT_USER`: Your MinIO username
   - `MINIO_ROOT_PASSWORD`: Your MinIO password

## Using MinIO with External Applications

### S3 SDK Configuration

You can use MinIO with any application that supports S3 storage. Use these parameters:

```
Endpoint: https://your-minio-service.onrender.com
Access Key: Your MINIO_ROOT_USER
Secret Key: Your MINIO_ROOT_PASSWORD
Region: us-east-1 (or any region, MinIO ignores this)
Force Path Style: true
```

### Creating Buckets

You can create buckets either through:
- The MinIO Console
- Using the MinIO Client (mc)
- Using the AWS CLI
- Using any S3-compatible SDK

### Bucket Policies

To make a bucket publicly readable, use the MinIO Console to set the bucket policy to "download" or use the MinIO Client:

```
mc policy set download myminio/yourbucket
```

## Structure

- `docker-compose.yml`: Local development setup
- `render.yaml`: Render deployment configuration
- `Dockerfile.minio`: Container configuration
- `init-minio.sh`: Script to initialize MinIO buckets 