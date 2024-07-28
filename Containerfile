# Get base image 
FROM registry.opensuse.org/opensuse/distrobox:latest


# Install additional packages
RUN sudo zypper -n ref && sudo zypper -n dup
RUN sudo zypper -n in python3 gawk

# Install Codium
RUN sudo zypper ar -p 100 obs://devel:tools:ide:vscode devel_tools_ide_vscode
RUN sudo zypper --gpg-auto-import-keys ref
RUN sudo zypper -n in code

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
