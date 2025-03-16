#!/bin/bash

SOURCE_DIR="/home/bumpsinthewire/test_dir"
touch /home/bumpsinthewire/move_log.txt
mkdir -p /home/bumpsinthewire/big_files

# Find all files in the source directory that are larger than 10MB and move them to a new directory called big_files in the user's home directory
for file in $(find "$SOURCE_DIR" -size +10M); do
	mv "$file" /home/bumpsinthewire/big_files
	echo "Moved '$file' to /home/bumpsinthewire/big_files" >> /home/bumpsinthewire/move_log.txt
done

