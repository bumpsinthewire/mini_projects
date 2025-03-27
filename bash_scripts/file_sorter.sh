#!/bin/bash

USER="bumpsinthewire"
SOURCE_DIR="/home/$USER/test_dir"
DEST_DIR="/home/$USER/big_files"

touch /home/$USER/move_log.txt
mkdir -p $DEST_DIR

# Find all files in the source directory that are larger than 10MB and move them to a new directory called big_files in the user's home directory
find "$SOURCE_DIR" -size +10M -exec sh -c 'mv "$1" "$2" && echo "Moved \"$1\" to \"$2\"" >> /home/$USER/move_log.txt' _ "{}" "$DEST_DIR" \;