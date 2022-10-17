### STAGE 1: Build ###
FROM nginx:latest

## Copy our default nginx config
COPY nginx/nginx.conf /etc/nginx/
COPY nginx/prod.conf /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
COPY app/ /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
