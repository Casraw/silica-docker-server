#!/bin/bash

# Replace placeholders in the ServerSettings.xml with environment variables
envsubst < ${SETTINGS_TEMPLATE} > ${SETTINGS_FILE}

# Start the Silica server
exec ./Silica.x86_64
