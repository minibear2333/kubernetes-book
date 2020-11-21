FROM nginx:stable-alpine

ENV content="minibear2333"
ARG operator="hey"
RUN echo "<h1>${operator} ${content}</h1>" > /usr/share/nginx/html/index.html
