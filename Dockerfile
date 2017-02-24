# nuestra imagen base
FROM alpine:3.5

# Instalar python and pip
RUN apk add --update py2-pip

# instalar módulos Python necesarios para la aplicación Python
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copiar archivos requeridos para que la aplicación se ejecute
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# indicar el número de puerto que el contenedor debe exponer
EXPOSE 5000

# ejecutar la aplicación
CMD ["python", "/usr/src/app/app.py"]