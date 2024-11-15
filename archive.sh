#!/usr/bin/env sh

# Create the archive directory if it doesn't exist
ARCHIVE_DIR="./archive"
mkdir -p "${ARCHIVE_DIR}"

# Generate the timestamp for the archive file
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_FILE="${ARCHIVE_DIR}/index_${TIMESTAMP}.html"

# Ensure the index.html file exists before copying
if [ -f index.html ]; then
    cp index.html "${ARCHIVE_FILE}"
    echo "Saved index.html to ${ARCHIVE_FILE}"
else
    echo "index.html does not exist. Skipping archive save."
    exit 1
fi
