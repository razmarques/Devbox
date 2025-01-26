# Set environment variables
ARG FEDORA_VERSION=41

# Get base image
FROM fedora:${FEDORA_VERSION}

# Update the system and install required packages
RUN dnf update -y && \
    dnf copr enable phracek/PyCharm -y && \
    rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
    sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' && \
    dnf install -y gtk git gh pipx pycharm-community pycharm-community-plugins code && \
    dnf clean all
