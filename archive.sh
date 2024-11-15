#!/usr/bin/env sh

# Create the archive directory if it doesn't exist
ARCHIVE_DIR="./archive"
mkdir -p "${ARCHIVE_DIR}"
touch "${ARCHIVE_DIR}/.gitkeep"

# Generate the timestamp for the archive file
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_FILE="${ARCHIVE_DIR}/index_${TIMESTAMP}.html"

# Ensure the index.html file exists before copying
if [ -f index.html ]; then
    cp index.html "${ARCHIVE_FILE}"
    echo "Saved index.html to ${ARCHIVE_FILE}"

    # Delete old archives keeping only the last few.
    # Reach into the commits for older.
    MAX_FILES=$((1 * 20))
    FILE_COUNT=$(ls -1 "${ARCHIVE_DIR}"/index_*.html 2>/dev/null | wc -l)
    if [ "$FILE_COUNT" -gt "$MAX_FILES" ]; then
        ls -t "${ARCHIVE_DIR}"/index_*.html | tail -n +$((MAX_FILES + 1)) | xargs rm -f
    fi
else
    echo "index.html does not exist. Skipping archive save."
fi
