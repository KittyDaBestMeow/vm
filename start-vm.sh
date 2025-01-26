#!/bin/bash

# Path to the Windows ISO and VM disk
ISO_PATH="/opt/windows_iso/windows10.iso"
DISK_PATH="/var/lib/libvirt/images/windows10_disk.qcow2"

# Create a 100GB disk image for the VM
qemu-img create -f qcow2 $DISK_PATH 100G

# Start the VM with 8GB of RAM, Windows 10 ISO, and noVNC support on port 4560
qemu-system-x86_64 \
    -m 8192 \
    -cdrom $ISO_PATH \
    -drive file=$DISK_PATH,format=qcow2 \
    -vga std \
    -net nic -net user \
    -cpu host \
    -enable-kvm \
    -nographic \
    -vnc :0 \
    -websocket 4560
