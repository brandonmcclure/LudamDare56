FROM ghcr.io/brandonmcclure/godot-docker/godot:4.3 AS builder
WORKDIR /app
COPY GameCode /app
RUN sh /app/buildscript.sh

FROM nginx:1.27.0
COPY --from=builder /app/bin/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf