FROM ubuntu:16.04

# Install required software
RUN apt-get update
RUN apt-get install -y nginx \
                       python3 \
                       python3-pip \
                       python3-venv

# Prepare virtual environment
RUN pip3 install --upgrade pip
RUN pip install uwsgi
RUN mkdir ~/django-venv
RUN python3 -m venv ~/django-venv

# Create required folder layout
RUN rm -rf /var/www/html
RUN mkdir /var/www/media
RUN mkdir /var/www/static

COPY default /etc/nginx/sites-enabled/
COPY DjangoDemo /var/www/
RUN pip install -r /var/www/requirements.txt

# Copy init file
COPY start.sh start.sh
CMD /bin/bash start.sh && tail -f /dev/null
EXPOSE 80/tcp