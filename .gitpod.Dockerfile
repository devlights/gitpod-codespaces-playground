FROM gitpod/workspace-full:latest

# Install Nushell
RUN brew install nushell

# Install go-task
RUN brew install go-task

# Install Go Libraries
RUN go install honnef.co/go/tools/cmd/staticcheck@latest
RUN go install golang.org/x/tools/cmd/goimports@latest
