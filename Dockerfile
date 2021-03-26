FROM ubuntu:21.04
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord

ENV DEBIAN_FRONTEND noninteractive

RUN apt update -y
RUN apt upgrade -y
RUN apt-get autoclean && apt-get autoremove

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/local/bin/supervisord"]