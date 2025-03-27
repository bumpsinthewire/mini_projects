#!/bin/bash
# user_create.sh - Automate user and group creation with args and error checking

# Check if username and groupname are provided
if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Usage: $0 <username> <groupname>"
	exit 1
fi 

USERNAME=$1
GROUPNAME=$2

# Check if group already exists
if getent group "$GROUPNAME" >/dev/null 2>&1; then
	echo "Group $GROUPNAME already exists!"
else
	sudo groupadd "$GROUPNAME"
	echo "Group $GROUPNAME created."
fi
 
# Check if user already exists
if id "$USERNAME" >/dev/null 2>&1;then
	echo "User $USERNAME already exists!"
	exit 1
fi 

# Create user and add to group
sudo useradd -m -g "$GROUPNAME" -s /bin/bash "$USERNAME"
if [ $? -eq 0 ]; then
	echo "User $USERNAME created and added to $GROUPNAME."
else
	echo "Failed to create user $USERNAME!"
	exit 1
fi

# set password (interactive)
sudo passwd $USERNAME

echo "User $USERNAME created and added to $GROUPNAME!"