FROM ubuntu:20.04

RUN apt update && apt upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata
RUN apt-get -y install apache2
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN apt install mariadb-server php8.1 libapache2-mod-php php-mbstring php-xmlrpc php-soap php-gd php-xml php-cli php-zip php-bcmath php-tokenizer php-json php-pear -y
RUN apt-get update
#RUN apt install mariadb-server
#RUN mysql_secure_installation
RUN curl -sS https://getcomposer.org/installer | php
#RUN mv composer.phar /usr/local/bin/composer
#RUN chmod +x /usr/local/bin/composer
 
WORKDIR /usr/app
COPY . .

EXPOSE 8000
CMD ["php", "artisan", "serve"]