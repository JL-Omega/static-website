# Use the Ubuntu 22.04 base image
FROM ubuntu:22.04

# Set the maintainer label
LABEL maintainer="Jean-Luc Mpande"

# Update the package list and install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy the contents of the static-website-example folder to /var/www/html
COPY static-website-example/ /var/www/html

# Expose port 80 to allow external access
EXPOSE 80

# Start Nginx in daemon mode when the container starts
CMD ["nginx", "-g", "daemon off;"]

