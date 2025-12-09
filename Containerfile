FROM fedora:latest
RUN dnf install -y httpd \
    && dnf clean all

RUN useradd collin \
    && echo "Containers are easy!" > /var/www/html/index.html
WORKDIR /
RUN mkdir /structure \
    && chmod 777 /structure

USER sync
WORKDIR /structure
RUN mkdir sync-work

USER nobody
RUN mkdir nobody-work

EXPOSE 80

ENTRYPOINT /usr/sbin/httpd -DFOREGROUND