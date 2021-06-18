  
FROM alpine:3.14.0

RUN apk add --no-cache openssh \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:toor" | chpasswd
  
  
RUN apk --update add wget \ 
		     curl \
		     git \
		     php7 \
		     php7-curl \
		     php7-openssl \
		     php7-iconv \
		     php7-json \
		     php7-mbstring \
		     php7-phar \
		     php7-session \
		     php7-xmlwriter \
		     php7-sqlite3 \
		     php7-pdo_sqlite \
		     php7-exif \
		     php7-fileinfo \
		     php7-pdo \
		     php7-xml \
		     php7-tokenizer \
		     php7-intl \		     
		     php7-dom && rm /var/cache/apk/*
         
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

COPY rootfs /
RUN chmod 755 /entrypoint.sh

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]

