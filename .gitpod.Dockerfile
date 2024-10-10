FROM gitpod/workspace-full:latest

# Install Miller
RUN sudo apt-get update && sudo apt-get install miller

# Install Dart
RUN brew tap dart-lang/dart && brew install dart

# Install Nushell
RUN brew install nushell

# Install go-task
RUN brew install go-task

# Install Go Libraries
RUN go install honnef.co/go/tools/cmd/staticcheck@latest
RUN go install golang.org/x/tools/cmd/goimports@latest

# Install Angular
RUN npm install -g @angular/cli
