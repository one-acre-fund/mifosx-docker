# Build image
FROM node:16 AS builder
WORKDIR /app

# Prepare
RUN npm install -g @angular/cli@9.1.12

# Download latest and setup
RUN git clone https://github.com/openMF/web-app/ && \
    cd web-app && \
    npm install

# Prepare runtime placeholders
COPY environments/ ./web-app/src/environments/

# Build - warning: SLOW!!
RUN cd web-app && ng build --prod


# Get Dockerize
FROM busybox as dockerize
ENV DOCKERIZE_VERSION v0.6.1
WORKDIR /app
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
RUN tar -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz


# Runtime image
FROM nginxinc/nginx-unprivileged

ENV SERVER_URL="https://demo.fineract.dev"
ENV TENANT_ID="default"

# Install Dockerize
COPY --from=dockerize /app/dockerize /usr/local/bin/

# Install app
COPY --from=builder --chown=nginx:nginx /app/web-app/dist/web-app/ /usr/share/nginx/html/

# Install startup script to substitute vars
COPY ./docker-entrypoint.d/ /docker-entrypoint.d/
