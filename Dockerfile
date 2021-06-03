# Build image
FROM node:16 AS builder
WORKDIR /app

# Download latest
RUN git clone https://github.com/openMF/web-app/

# Build
RUN npm install -g @angular/cli@9.1.12
RUN cd web-app && npm install && ng build --prod


# Runtime image
FROM nginxinc/nginx-unprivileged
COPY --from=builder /app/web-app/dist/web-app/ /usr/share/nginx/html/
