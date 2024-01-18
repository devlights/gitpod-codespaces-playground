FROM gitpod/workspace-full:latest

# Install Nushell
RUN brew install nushell

# Install go-task
RUN brew install go-task
