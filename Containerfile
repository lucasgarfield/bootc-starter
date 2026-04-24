FROM quay.io/fedora/fedora-bootc:42

# Add your packages here
RUN dnf -y install vim-enhanced tmux && dnf clean all
