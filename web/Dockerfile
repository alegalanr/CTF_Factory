# Usar nginx como servidor web
FROM nginx:alpine

# Copiar los archivos de la web al directorio de nginx
COPY src/ /usr/share/nginx/html/

# Copiar la configuración personalizada de nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponer el puerto 80
EXPOSE 80

# Nginx se ejecuta automáticamente
CMD ["nginx", "-g", "daemon off;"]
