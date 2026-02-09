FROM nginx:alpine

# hapus default config
RUN rm -rf /usr/share/nginx/html/*

# copy static html
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
