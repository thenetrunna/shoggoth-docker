# Use a base image with wget and unzip (like Ubuntu)
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && \
    apt-get install -y wget unzip

# Set a working directory
WORKDIR /root/shoggoth

# Download Shoggoth binaries
RUN wget https://shoggoth.systems/download/v0.1.7/shoggoth-v0.1.7-Linux-x86_64.zip

# Verify checksum (replace 'checksum_here' with actual checksum)
RUN echo "0b06fd6746d687e6f01ec65c39d00f5d04acd48c5036b521797ef79347f94a28 shoggoth-v0.1.7-Linux-x86_64.zip" | sha256sum -c -

# Unzip the binaries
RUN unzip -o -q shoggoth-v0.1.7-Linux-x86_64.zip -d /root/shoggoth

# Run the install script
RUN ./scripts/install.sh

# Expose any necessary ports (replace with actual ports used by Shoggoth)
EXPOSE 6969

# Command to start Shoggoth (replace with actual start command)
CMD ["/root/shoggoth/bin/shog", "node", "run"]
