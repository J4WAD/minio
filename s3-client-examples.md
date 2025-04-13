# MinIO S3 Client Examples

## JavaScript (AWS SDK v3)

```javascript
import { S3Client, PutObjectCommand, GetObjectCommand } from "@aws-sdk/client-s3";

const s3Client = new S3Client({
  endpoint: "https://your-minio-service.onrender.com",
  region: "us-east-1", // MinIO ignores this, but it's required
  credentials: {
    accessKeyId: "your-minio-user",
    secretAccessKey: "your-minio-password"
  },
  forcePathStyle: true // Required for MinIO
});

// Upload a file
async function uploadFile(bucket, key, body) {
  const command = new PutObjectCommand({
    Bucket: bucket,
    Key: key,
    Body: body
  });
  
  return await s3Client.send(command);
}

// Download a file
async function getFile(bucket, key) {
  const command = new GetObjectCommand({
    Bucket: bucket,
    Key: key
  });
  
  const response = await s3Client.send(command);
  return await response.Body.transformToByteArray();
}
```

## Python (boto3)

```python
import boto3

s3 = boto3.resource('s3',
    endpoint_url='https://your-minio-service.onrender.com',
    aws_access_key_id='your-minio-user',
    aws_secret_access_key='your-minio-password',
    region_name='us-east-1',  # MinIO ignores this
    config=boto3.session.Config(signature_version='s3v4', s3={'addressing_style': 'path'})
)

# Upload a file
def upload_file(bucket_name, key, file_path):
    bucket = s3.Bucket(bucket_name)
    with open(file_path, 'rb') as data:
        bucket.put_object(Key=key, Body=data)

# Download a file
def download_file(bucket_name, key, output_path):
    bucket = s3.Bucket(bucket_name)
    bucket.download_file(key, output_path)
```

## PHP

```php
<?php
require 'vendor/autoload.php';

use Aws\S3\S3Client;

$s3 = new S3Client([
    'version' => 'latest',
    'region'  => 'us-east-1', // MinIO ignores this
    'endpoint' => 'https://your-minio-service.onrender.com',
    'use_path_style_endpoint' => true, // Required for MinIO
    'credentials' => [
        'key'    => 'your-minio-user',
        'secret' => 'your-minio-password',
    ],
]);

// Upload a file
function uploadFile($bucket, $key, $filePath) {
    global $s3;
    $result = $s3->putObject([
        'Bucket' => $bucket,
        'Key'    => $key,
        'Body'   => fopen($filePath, 'r'),
    ]);
    return $result;
}

// Download a file
function downloadFile($bucket, $key, $outputPath) {
    global $s3;
    $result = $s3->getObject([
        'Bucket' => $bucket,
        'Key'    => $key,
        'SaveAs' => $outputPath
    ]);
    return $result;
}
?>
```

## Go

```go
package main

import (
	"context"
	"log"
	"os"
	
	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
)

func main() {
	// Initialize MinIO client
	endpoint := "your-minio-service.onrender.com"
	accessKeyID := "your-minio-user"
	secretAccessKey := "your-minio-password"
	useSSL := true
	
	// Create client
	minioClient, err := minio.New(endpoint, &minio.Options{
		Creds:  credentials.NewStaticV4(accessKeyID, secretAccessKey, ""),
		Secure: useSSL,
	})
	if err != nil {
		log.Fatalln(err)
	}
	
	// Upload a file
	bucketName := "your-bucket"
	objectName := "your-object-key"
	filePath := "path/to/file"
	contentType := "application/octet-stream"
	
	// Upload
	_, err = minioClient.FPutObject(context.Background(), bucketName, objectName, filePath, minio.PutObjectOptions{ContentType: contentType})
	if err != nil {
		log.Fatalln(err)
	}
	
	// Download a file
	err = minioClient.FGetObject(context.Background(), bucketName, objectName, "path/to/download", minio.GetObjectOptions{})
	if err != nil {
		log.Fatalln(err)
	}
}
``` 