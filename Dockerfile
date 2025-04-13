FROM ghcr.io/muchobien/pocketbase:latest

WORKDIR /pb

# Create directories for hooks
RUN mkdir -p /pb/pb_hooks

# Copy our hooks
COPY ./pb_hooks /pb/pb_hooks

EXPOSE 8080

# Command to run PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"] 