FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >>/etc/nginx/nginx.conf
RUN curl -o /var/www/html/restoran.zip -L https://www.free-css.com/assets/files/free-css-templates/download/page290/restoran.zip

RUN cd /var/www/html/ && unzip restoran.zip  && mv bootstrap-restaurant-template/* . && rm -rf restoran.zip

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]

