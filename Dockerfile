# Use the Nginx base image
FROM nginx:alpine

# Remove default configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom configuration that uses Heroku's dynamic port
COPY nginx.conf /etc/nginx/templates/default.conf.template

# Copy website files
COPY . /usr/share/nginx/html/

# Expose the port that Nginx will use (although Heroku overrides it internally)
EXPOSE 8080

# Nginx will automatically read the value of $PORT thanks to its templating system
CMD ["nginx", "-g", "daemon off;"]
