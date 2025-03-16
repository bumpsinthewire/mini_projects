#!/bin/bash

if grep -q '5' /etc/default/grub; then
	echo 'Grub has timeout of 5 seconds.'
else
	echo 'Grub DOES NOT have a timeout of 5 seconds.'
fi

