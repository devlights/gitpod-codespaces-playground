FROM gitpod/workspace-full:latest

ARG GITPOD_HOME_TMP="/home/gitpod/tmp"
ARG GITPOD_HOME_GO="/home/gitpod/go"
ARG GITPOD_HOME_GO_OLD="/home/gitpod/go-old"
ARG GO_VERSION="1.20.4"

USER gitpod

# Install Go
RUN sudo apt-get update -q && \
    rm -rf ${GITPOD_HOME_TMP} && \
    mkdir -p ${GITPOD_HOME_TMP} && \
    cd ${GITPOD_HOME_TMP} && \
    wget -q -O go.tar.gz https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar zxf go.tar.gz && \
    mv ${GITPOD_HOME_GO} ${GITPOD_HOME_GO_OLD} && \
    mv go /home/gitpod

# Install Dart
RUN brew tap dart-lang/dart \
    && brew install dart \
    && printf '%s\n' 'export PATH=$HOME/.pub-cache/bin:$PATH' > $HOME/.bashrc.d/400-dart

# Install Python 3.10.7
RUN pyenv install 3.10.7 \
    && pyenv global 3.10.7

# Install JDK
RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 17.0.5-tem && \
    sdk default java 17.0.5-tem && \
    sdk install springboot 2.7.5"

# Install Kotlin
RUN brew install kotlin
