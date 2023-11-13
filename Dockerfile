# Use a base image with wget and unzip (like Ubuntu)
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && \
    apt-get install -y wget unzip

# Set a working directory
WORKDIR /root/shoggoth

# Download Shoggoth binaries
RUN wget https://shoggoth.systems/download/v0.1.5/shoggoth-v0.1.5-Linux-x86_64.zip

# Verify checksum (replace 'checksum_here' with actual checksum)
RUN echo "28e1e2518be379fcff1f69b9292d6faaba8503c39b3e6b83985635ea5df80330 shoggoth-v0.1.5-Linux-x86_64.zip" | sha256sum -c -

# Unzip the binaries
RUN unzip -o -q shoggoth-v0.1.5-Linux-x86_64.zip -d /root/shoggoth

# Run the install script
RUN ./scripts/install.sh

# Expose any necessary ports (replace with actual ports used by Shoggoth)
EXPOSE 6969

# Command to start Shoggoth (replace with actual start command)
CMD ["/root/shoggoth/bin/shog", "node", "run"]
