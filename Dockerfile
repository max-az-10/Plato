# Use the official NGINX image to serve the template
FROM nginx:1.27-alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the CSS template files into the container
COPY ./Plato /usr/share/nginx/html

# Expose port 80 to serve the template
EXPOSE 80

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
