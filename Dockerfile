# Use the official Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV STEAMCMD_DIR=/home/steam/steamcmd
ENV SILICA_DIR=/home/steam/Silica-Server
ENV SETTINGS_TEMPLATE=/home/steam/Silica/ServerSettings.template.xml
ENV SETTINGS_FILE=/home/steam/Silica/ServerSettings.xml

# Install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    lib32gcc-s1 \
    lib32stdc++6 \
    wget \
    tar \
    ca-certificates \
    libstdc++6 \
    nano \
    gettext \
    && rm -rf /var/lib/apt/lists/*

# Create steam user
RUN useradd -m steam

# Switch to steam user
USER steam
WORKDIR /home/steam

# Create directories
RUN mkdir -p ${STEAMCMD_DIR} ${SILICA_DIR} /home/steam/.steam/sdk64
RUN mkdir /home/steam/Silica

# Install SteamCMD
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd_linux.tar.gz && \
    tar -xvzf /tmp/steamcmd_linux.tar.gz -C ${STEAMCMD_DIR} && \
    rm /tmp/steamcmd_linux.tar.gz

# Install Silica Server
RUN ${STEAMCMD_DIR}/steamcmd.sh +force_install_dir ${SILICA_DIR} +login anonymous +app_update 2738040 validate +quit

# Link the steamclient.so library
RUN ln -s ${STEAMCMD_DIR}/linux64/steamclient.so /home/steam/.steam/sdk64/steamclient.so

# Copy the entrypoint script and the template file
COPY --chown=steam:steam entrypoint.sh /home/steam/entrypoint.sh
COPY --chown=steam:steam ServerSettings.template.xml /home/steam/Silica/ServerSettings.template.xml
RUN chmod +x /home/steam/entrypoint.sh

# Expose the necessary port (replace 27015 with the actual port your server uses)
EXPOSE 26900 26901

# Set the working directory to the Silica server directory
WORKDIR ${SILICA_DIR}

# Start the Silica server
ENTRYPOINT ["/home/steam/entrypoint.sh"]
