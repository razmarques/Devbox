# Set environment variables
ARG FEDORA_VERSION=42

# Get base image
FROM fedora:${FEDORA_VERSION}

# Update the system and install required packages
RUN dnf update -y && \
    # dnf copr enable phracek/PyCharm -y && \
    dnf copr enable iucar/rstudio -y && \
    rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
    sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' && \
    # dnf install -y gtk4 git gh pipx pycharm-community pycharm-community-plugins code rstudio-desktop && \
    dnf install -y gtk4 git gh pipx code rstudio-desktop && \
    dnf clean all
