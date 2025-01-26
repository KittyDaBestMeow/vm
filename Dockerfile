# Use an official Ubuntu as base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    qemu \
    qemu-kvm \
    libvirt-bin \
    bridge-utils \
    websockify \
    novnc \
    wget \
    unzip \
    curl \
    && apt-get clean

# Create directories
RUN mkdir -p /var/lib/libvirt/images /opt/windows_iso

# Set working directory
WORKDIR /opt/windows_iso

# Download the Windows 10 ISO from the provided URL
RUN curl -o windows10.iso "https://dw.uptodown.com/dwn/Bz-fcSB2uID8-ScJ9u8nCBLE8-C0sD-6pyz5ghpLZF9YJ083NSvdUBIiRNU3n2o9mTrS4w0C1DSD9s5749XKg8LCWkZgXZAviJltPMsKeh2UDSfxywfsJDcRgtGQz8RC/N6DuWxAD83YCWQW49gvbzkveLnN3XiyQzoQm2rMRQXwC50KlXiOXzssWEPq1Lz-fP2j9erOub9ympwgGBxNqYK2rcFFNk3GDSeYVhmFsINP65Duthcagc6evl6xPSlQD/69WrvL6w1dNeyBXtI_Yw8Y0VO1lFW-ePmbhRbRORuSu7FZZ7tzElC9hIVPOJcKK8wqplBH5V2ThU7IhPHorcU0gxOoPHUw2G58-xxTP4340=/"

# Expose noVNC port
EXPOSE 4560

# Entry point to run the VM
CMD ["bash", "/scripts/start-vm.sh"]
