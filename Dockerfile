FROM debian:12

RUN sed -i 's/deb.debian.org/debian.c3sl.ufpr.br/g' /etc/apt/sources.list || true

RUN apt update && apt install -y curl wget systemd libpam-systemd && apt clean

# Java 8
RUN curl -L https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u392-b08/OpenJDK8U-jre_x64_linux_hotspot_8u392b08.tar.gz -o /tmp/java8.tar.gz && \
    tar -xzf /tmp/java8.tar.gz -C /opt && \
    mv /opt/jdk8u392-b08-jre /opt/java8 && \
    rm /tmp/java8.tar.gz

# Java 17
RUN curl -L https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.9%2B9/OpenJDK17U-jre_x64_linux_hotspot_17.0.9_9.tar.gz -o /tmp/java17.tar.gz && \
    tar -xzf /tmp/java17.tar.gz -C /opt && \
    mv /opt/jdk-17.0.9+9-jre /opt/java17 && \
    rm /tmp/java17.tar.gz

# Java 21
RUN curl -L https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.5%2B11/OpenJDK21U-jre_x64_linux_hotspot_21.0.5_11.tar.gz -o /tmp/java21.tar.gz && \
    tar -xzf /tmp/java21.tar.gz -C /opt && \
    mv /opt/jdk-21.0.5+11-jre /opt/java21 && \
    rm /tmp/java21.tar.gz

# Java 25
RUN curl -L https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.3%2B9/OpenJDK25U-jre_x64_linux_hotspot_25.0.3_9.tar.gz -o /tmp/java25.tar.gz && \
    tar -xzf /tmp/java25.tar.gz -C /opt && \
    mv /opt/jdk-25.0.3+9-jre /opt/java25 && \
    rm /tmp/java25.tar.gz

# Aliases globais
RUN echo 'alias java8="/opt/java8/bin/java"' >> /etc/bash.bashrc && \
    echo 'alias java17="/opt/java17/bin/java"' >> /etc/bash.bashrc && \
    echo 'alias java21="/opt/java21/bin/java"' >> /etc/bash.bashrc && \
    echo 'alias java25="/opt/java25/bin/java"' >> /etc/bash.bashrc

