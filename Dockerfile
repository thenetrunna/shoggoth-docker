# Use a base image with wget and unzip (like Ubuntu)
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && \
    apt-get install -y wget unzip

# Set a working directory
WORKDIR /root/shoggoth

# Download Shoggoth binaries
RUN wget https://shog.ai/download/v0.2.1/shoggoth-v0.2.1-Linux-x86_64.zip

# Verify checksum (replace 'checksum_here' with actual checksum)
RUN echo "88464be35ad017fe11b21edf0f86aa8df84e8b53b6fd9b224df149873b8eafd3 shoggoth-v0.2.1-Linux-x86_64.zip" | sha256sum -c -

# Unzip the binaries
RUN unzip -o -q shoggoth-v0.2.1-Linux-x86_64.zip -d /root/shoggoth

# Run the install script
RUN ./scripts/install.sh

# Expose any necessary ports (replace with actual ports used by Shoggoth)
EXPOSE 6969

# Command to start Shoggoth (replace with actual start command)
CMD ["/root/shoggoth/bin/shog", "node", "run"]
