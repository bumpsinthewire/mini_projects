#!/bin/bash

USER="bumpsinthewire"
SOURCE_DIR="/home/$USER/test_dir"
DEST_DIR="/home/$USER/big_files"

touch /home/$USER/move_log.txt
mkdir -p $DEST_DIR

# Find all files in the source directory that are larger than 10MB and move them to a new directory called big_files in the user's home directory
for file in $(find "$SOURCE_DIR" -size +10M); do
	mv "$file" $DEST_DIR
	echo "Moved '$file' to $DEST_DIR" >> /home/$USER/move_log.txt
done

