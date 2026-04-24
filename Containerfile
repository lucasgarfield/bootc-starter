FROM quay.io/fedora/fedora-bootc:latest

# Add your packages here
RUN dnf -y install vim-enhanced tmux && dnf clean all

RUN mkdir -p /usr/lib/bootc/kargs.d && \
    printf '[kargs]\nmatch-architectures = ["x86_64"]\nappend = ["audit=0"]\n' \
    > /usr/lib/bootc/kargs.d/01-audit.toml

# Default login — change this!
RUN useradd -m -G wheel admin && echo "admin:password" | chpasswd
