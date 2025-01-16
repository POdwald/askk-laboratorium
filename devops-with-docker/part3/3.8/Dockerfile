# Stage 1: Build the frontend
FROM node:16-alpine AS build-stage

# Set working directory
WORKDIR /usr/src/app

# Copy the frontend source code into the container
COPY . .

# Install dependencies and build the app
RUN npm install
RUN npm run build

# Stage 2: Serve the built frontend
FROM nginx:alpine AS production-stage

# Copy the built assets from the build stage
COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html

# Expose port 80 for serving the app
EXPOSE 80

# Start nginx to serve the static files
CMD ["nginx", "-g", "daemon off;"]
