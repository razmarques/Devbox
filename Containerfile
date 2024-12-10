# Get base image 
FROM registry.opensuse.org/opensuse/distrobox:latest

# Set environment variables
ENV PYCHARM_VERSION=2024.3 \
    INSTALL_DIR=/opt/pycharm

# Update the system and install required packages
RUN zypper refresh && zypper -n dup && zypper install -y --no-recommends \
    python3 \
    gawk \
    rstudio-desktop \
    gh \
    wget \
    java-11-openjdk \
    xz \
    libXrender1 \
    libXtst6 \
    libX11-6 \
    libXrandr2 \
    libXi6 \
    libXinerama1 \
    fontconfig \
    freetype2 \
    && zypper clean -a

# Install poetry
RUN PYTHON_VERSION=$(python3 --version | awk '{print $2}' | awk -F. '{print $1 $2}') \
    && sudo zypper install -y python$PYTHON_VERSION-poetry

# Install Codium
RUN sudo zypper ar -p 100 obs://devel:tools:ide:vscode devel_tools_ide_vscode
RUN sudo zypper --gpg-auto-import-keys ref
RUN sudo zypper -n in code

# Download and install PyCharm Community Edition
RUN mkdir -p ${INSTALL_DIR} && chmod 777 ${INSTALL_DIR} && \
    wget -O /tmp/pycharm.tar.gz https://download.jetbrains.com/python/pycharm-community-${PYCHARM_VERSION}.tar.gz && \
    sudo tar --no-same-owner --no-same-permissions -xzf /tmp/pycharm.tar.gz --strip-components=1 -C ${INSTALL_DIR} && \
    rm /tmp/pycharm.tar.gz

# Set the working directory
WORKDIR ${INSTALL_DIR}

# Add PyCharm bin to PATH
ENV PATH="${INSTALL_DIR}/bin:$PATH"
