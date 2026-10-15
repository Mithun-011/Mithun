FROM nginx:alpine

ENV PORT=3000

COPY public/ /usr/share/nginx/html/
COPY deploy/default.conf.template /etc/nginx/templates/default.conf.template

RUN rm -f /etc/nginx/conf.d/default.conf

EXPOSE 3000
