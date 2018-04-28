FROM nginx:latest

ADD /nginx/default /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y git

WORKDIR /home

RUN git clone https://gitlab.com/sinsin91/laravel-example.git

RUN chmod 777 -R laravel-example
