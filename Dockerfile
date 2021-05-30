  
FROM alpine:3.13.5

RUN apk add --no-cache openssh \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:toor" | chpasswd

COPY rootfs /

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]

