// S3 configuration for MinIO
onAfterBootstrap((e) => {
    const endpoint = $os.getenv("S3_ENDPOINT") || "http://minio:9000";
    const bucket = $os.getenv("S3_BUCKET") || "pocketbase";
    const region = $os.getenv("S3_REGION") || "us-east-1";
    const accessKey = $os.getenv("S3_ACCESS_KEY") || "minioadmin";
    const secretKey = $os.getenv("S3_SECRET_KEY") || "minioadmin";

    try {
        // Configure the app.storage to use S3
        $app.settings().filesystems = [
            {
                "name": "storage",
                "type": "s3",
                "endpoint": endpoint,
                "bucket": bucket,
                "region": region,
                "forcePathStyle": true,
                "credentials": {
                    "access_key_id": accessKey,
                    "secret_access_key": secretKey
                }
            }
        ];
        
        console.log("Successfully configured S3 storage with MinIO");
    } catch (err) {
        console.error("Failed to configure S3 storage:", err);
    }
}); 