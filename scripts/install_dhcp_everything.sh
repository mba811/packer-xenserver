#!/bin/bash

mount /dev/sda1 /mnt

cp /tmp/dhcp-everything /mnt/etc/init.d/dhcp-everything
chmod 755 /mnt/etc/init.d/dhcp-everything
ln -s ../init.d/dhcp-everything /mnt/etc/rc3.d/S99dhcp-everything

# Clean up
umount /mnt

