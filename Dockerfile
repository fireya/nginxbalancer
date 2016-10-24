FROM nginx:alpine

EXPOSE 80

ADD index.ctmpl /index.ctmpl
ADD nginx.ctmpl /nginx.ctmpl
ADD nginx.conf  /etc/nginx/nginx.conf
ADD index.html  /www/index.html
ADD consul-template   /consul-template
RUN chmod +x /consul-template

CMD ["/consul-template", "-consul", "consul.service.consul:8500", "-template", "/nginx.ctmpl:/etc/nginx/nginx.conf:/reload.sh", "-template", "/index.ctmpl:/www/index.html"]
