onAfterBootstrap((e) => {
    // Configure MinIO as the file storage
    const fs = require('@pocketbase/fs-store').default;

    const minioConfig = {
        endpoint: process.env.MINIO_ENDPOINT || 'play.min.io',
        port: parseInt(process.env.MINIO_PORT) || 9000,
        useSSL: process.env.MINIO_USE_SSL === 'true',
        accessKey: process.env.MINIO_ROOT_USER,
        secretKey: process.env.MINIO_ROOT_PASSWORD,
        bucket: process.env.MINIO_BUCKET || 'pocketbase-uploads',
    };

    // Initialize MinIO client
    const minioFs = new fs.MinioStore(minioConfig);
    
    // Set as default file storage
    $app.store().setFileSystem(minioFs);
}); 