FROM alpine:latest

# Install required packages
RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget

# Download and install PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.19.4/pocketbase_0.19.4_linux_amd64.zip \
    && unzip pocketbase_0.19.4_linux_amd64.zip \
    && rm pocketbase_0.19.4_linux_amd64.zip \
    && chmod +x /pocketbase

# Create directory for PocketBase data
RUN mkdir /pb_data

# Expose the default PocketBase port
EXPOSE 8090

# Start PocketBase
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8090"] 