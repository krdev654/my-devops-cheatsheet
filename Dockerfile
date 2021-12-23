FROM node:13-alpine

# Setup environment variables
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# create a directory
RUN mkdir -p /home/app

# Copy the node js app code from the current directory to the container /home/app folder
COPY . /home/app

# Start the app
CMD ["node", "server.js"]
