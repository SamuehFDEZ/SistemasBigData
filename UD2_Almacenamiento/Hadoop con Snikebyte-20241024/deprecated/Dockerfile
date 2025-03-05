# Usa la imagen base de Ubuntu 20.04
FROM ubuntu:20.04

# Configura la zona horaria automáticamente para evitar interacción
ENV DEBIAN_FRONTEND=noninteractive

# Actualiza el sistema e instala dependencias necesarias
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-8-jdk \
    wget \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3 \
    python3-pip \
    tzdata \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Verifica la instalación de pip
RUN pip3 --version

# Actualiza pip y luego instala Snakebite
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir snakebite

# Configura las variables de entorno para Java y Hadoop
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_VERSION=3.3.2
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin

# Verifica JAVA_HOME
RUN echo $JAVA_HOME
RUN java -version

# Descarga e instala Hadoop
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \
    && tar -xzf hadoop-${HADOOP_VERSION}.tar.gz -C /opt/ \
    && mv /opt/hadoop-${HADOOP_VERSION} /opt/hadoop \
    && rm hadoop-${HADOOP_VERSION}.tar.gz

# Copia los archivos de configuración de Hadoop
COPY core-site.xml $HADOOP_HOME/etc/hadoop/
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/

# Define el comando por defecto para iniciar el contenedor
CMD ["bash"]
