# Imagen base con Java 8
FROM openjdk:8-jdk-alpine

# Definir las variables de entorno
ENV FLUME_VERSION=1.9.0
ENV FLUME_HOME=/opt/flume
ENV PATH=$FLUME_HOME/bin:$PATH

# Instalar dependencias, descargar Apache Flume y configurarlo
RUN apk add --no-cache bash wget tar \
    && wget https://archive.apache.org/dist/flume/${FLUME_VERSION}/apache-flume-${FLUME_VERSION}-bin.tar.gz \
    && tar -xvzf apache-flume-${FLUME_VERSION}-bin.tar.gz -C /opt/ \
    && mv /opt/apache-flume-${FLUME_VERSION}-bin $FLUME_HOME \
    && rm apache-flume-${FLUME_VERSION}-bin.tar.gz

# Definir el directorio de trabajo
WORKDIR $FLUME_HOME

# Comando por defecto para ejecutar Flume
CMD ["flume-ng"]
