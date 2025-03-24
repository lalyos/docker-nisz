FROM ubuntu:24.04

RUN apt-get update -qq
RUN apt-get install -y curl html2text nginx

EXPOSE 80
COPY  start.sh /
RUN chmod +x /start.sh
CMD [ "/start.sh" ]