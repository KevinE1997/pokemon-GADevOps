# Usa la imagen base de Nginx
FROM nginx:alpine

# Elimina configuración por defecto
RUN rm /etc/nginx/conf.d/default.conf

# Copia configuración personalizada que usa el puerto dinámico de Heroku
COPY nginx.conf /etc/nginx/templates/default.conf.template

# Copia archivos del sitio web
COPY . /usr/share/nginx/html/

# Expone el puerto que usará Nginx (aunque Heroku lo sobrescribe internamente)
EXPOSE 8080

# Nginx leerá automáticamente el valor de $PORT gracias a su sistema de plantillas
CMD ["nginx", "-g", "daemon off;"]
