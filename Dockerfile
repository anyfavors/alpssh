  
FROM alpine:3.15.3

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
		     php7-dom \
		     python3 \
		     py3-pip \
		     py3-lxml \
		     py3-regex \
		     libxml2-dev \
		     sudo \
		     bash \
		     screen \
		     chromium \
		     nss \
		     freetype \
		     harfbuzz \
		     ca-certificates \
		     ttf-freefont \
		     && rm /var/cache/apk/*
         
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN pip install requests requests_html parsel dateparser



COPY rootfs /
RUN chmod 755 /entrypoint.sh

RUN adduser -h /home/smarc -s /bin/bash -D smarc

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]

