FROM nginx:latest

# Update
RUN apt-get update && apt-get install -y --force-yes wget apache2-utils && apt-get clean
# Install confd
RUN wget --no-check-certificate --output-document=/usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && chmod +x /usr/local/bin/confd
# Prepare config files
RUN mkdir -p /etc/confd/{'conf.d','templates'}
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates

# startup scripts
COPY scripts/boot.sh /usr/local/bin/boot.sh
RUN chmod +x /usr/local/bin/boot.sh

EXPOSE 80

ENTRYPOINT ["sh", "/usr/local/bin/boot.sh"]