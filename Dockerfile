FROM nginx:alpine

EXPOSE 80

COPY index.ctmpl /
COPY nginx.ctmpl /
COPY nginx.conf  /etc/nginx/nginx.conf
COPY index.html  /www/index.html
COPY consul-template   /consul-template
RUN chmod +x /consul-template

CMD ["/consul-template", "-consul", "consul.service.consul:8500", "-template", "/nginx.ctmpl:/etc/nginx/nginx.conf:/reload.sh", "-template", "/index.ctmpl:/www/index.html"]
