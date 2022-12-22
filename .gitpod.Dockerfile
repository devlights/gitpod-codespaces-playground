FROM gitpod/workspace-full-vnc:latest

USER gitpod

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

# Install Flutter
ENV ANDROID_HOME=$HOME/androidsdk \
    FLUTTER_VERSION=3.3.0-stable \
    QTWEBENGINE_DISABLE_SANDBOX=1
ENV PATH="$HOME/flutter/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

RUN wget -q "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz" -O - \
    | tar xpJ -C "$HOME" \
    && _file_name="commandlinetools-linux-8092744_latest.zip" && wget "https://dl.google.com/android/repository/$_file_name" \
    && unzip "$_file_name" -d $ANDROID_HOME \
    && rm -f "$_file_name" \
    && mkdir -p $ANDROID_HOME/cmdline-tools/latest \
    && mv $ANDROID_HOME/cmdline-tools/{bin,lib} $ANDROID_HOME/cmdline-tools/latest \
    && yes | sdkmanager "platform-tools" "build-tools;31.0.0" "platforms;android-31" \
    && flutter precache && for _plat in web linux-desktop; do flutter config --enable-${_plat}; done \
    && flutter config --android-sdk $ANDROID_HOME \
    && yes | flutter doctor --android-licenses \
    && flutter doctor
