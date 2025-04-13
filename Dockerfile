FROM minio/minio:latest

# Set environment variables
ENV MINIO_ROOT_USER=minioadmin
ENV MINIO_ROOT_PASSWORD=minioadmin

# Expose only one port for both API and console
EXPOSE 9000

# Use the single port for both API and console access
CMD ["server", "/data", "--console-address", ":9000"] 