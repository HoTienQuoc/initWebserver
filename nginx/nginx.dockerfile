FROM nginx:1.29.1-alpine-slim
ADD default.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /var/www/html