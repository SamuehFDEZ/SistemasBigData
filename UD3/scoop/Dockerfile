# Usamos una imagen base de Ubuntu
FROM ubuntu:20.04

# Establecemos el directorio de trabajo
WORKDIR /app

# Instalamos dependencias necesarias
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    wget \
    curl \
    tar \
    gnupg \
    tree \  # Aquí instalamos tree \ 
    rm -rf /var/lib/apt/lists/*

# Instalamos Apache Flume
RUN wget https://dlcdn.apache.org/flume/1.11.0/apache-flume-1.11.0-bin.tar.gz -O flume.tar.gz && \
    tar -xvzf flume.tar.gz && \
    mv apache-flume-1.11.0-bin /opt/flume

# Instalamos Apache Hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1-src.tar.gz -O hadoop.tar.gz && \
    tar -xvzf hadoop.tar.gz && \
    mv hadoop-3.4.1-src /opt/hadoop

# Establecemos las variables de entorno para Java y Hadoop
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin

# Configuración de Hadoop (opcional)
# Puedes incluir tus propios archivos de configuración si es necesario
# COPY core-site.xml $HADOOP_HOME/etc/hadoop/
# COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/

# Exponemos puertos si es necesario (puertos de Flume y Hadoop)
EXPOSE 8080 50070

# Definimos el comando que se ejecutará cuando el contenedor se inicie
CMD ["bash"]
