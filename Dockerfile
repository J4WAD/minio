FROM minio/minio:latest

# Create default buckets
ENV MINIO_ROOT_USER=minioadmin
ENV MINIO_ROOT_PASSWORD=minioadmin

EXPOSE 9000
EXPOSE 9001

CMD ["server", "/data", "--console-address", ":9001"] 