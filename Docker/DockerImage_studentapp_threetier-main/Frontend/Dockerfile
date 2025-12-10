FROM ubuntu:22.04

LABEL APP="StudentappFE"
LABEL DevopsEngg="Anup"

WORKDIR /opt/

# Install Apache
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    apt-get clean

COPY index.html /var/www/html/index.html

EXPOSE 3000
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

