# MinIO S3 Storage for PocketBase

This repository contains configuration for deploying MinIO, an S3-compatible object storage server, on Render to use with PocketBase.

## Deployment on Render

1. Fork this repository
2. Create a new Render Web Service using this repository
3. Use the "Blueprint" option to deploy using the `render.yaml` file
4. Set secure environment variables for `MINIO_ROOT_USER` and `MINIO_ROOT_PASSWORD`
5. Deploy the service

## Connecting to PocketBase

Once deployed, you'll need to configure PocketBase to use this S3 storage:

1. In PocketBase admin UI, go to Settings > Files storage
2. Select "S3" as the storage provider
3. Configure the following settings:
   - Endpoint: `https://your-minio-app-name.onrender.com`
   - Bucket: `pb-files` (create this bucket in MinIO console first)
   - Region: leave empty
   - Access Key: Your MinIO root user name
   - Secret Key: Your MinIO root password
   - Force path style: Enabled

## Accessing MinIO Console

The MinIO console is available at: `https://your-minio-app-name.onrender.com:9001`

Use your configured root credentials to log in and manage buckets.

## Creating Buckets

After deployment, you'll need to log into the MinIO console and create a bucket named `pb-files` for PocketBase to use.

## Security Recommendations

- Change the default credentials
- Set up proper bucket policies
- Consider setting up IAM users instead of using root credentials 