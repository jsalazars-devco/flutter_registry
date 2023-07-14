# Stage 1: Build Flutter app
FROM ubuntu:20.04 AS builder

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    unzip \
    xz-utils \
    libglu1-mesa

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter --depth=1

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# Copy the app source code and pubspec files
WORKDIR /app
COPY . /app

# Build the Flutter app
RUN flutter build web --release

# Stage 2: Serve Flutter app
FROM nginx:alpine

# Copy the built app from the builder stage
COPY --from=builder /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
