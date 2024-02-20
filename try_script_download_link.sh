#!/bin/bash

# Get the downloadable link from the user
echo "Enter the downloadable link of the file:"
read download_link

# Validate the link (basic check, adjust as needed)
if [[ ! "$download_link" =~ ^https?:// ]]; then
  echo "Invalid link format. Please start with https:// or http://."
  exit 1
fi

# Get the filename from the link
filename=${download_link##*/}

# Download the file (replace wget with your preferred download tool)
wget -O "$filename" "$download_link"

# Check if download was successful
if [[ $? -ne 0 ]]; then
  echo "Error downloading the file. Please check the link."
  exit 1
fi

# Check if the file is actually a zip file
if [[ ! "$filename" =~ \.zip$ ]]; then
  echo "Downloaded file is not a zip file. Skipping extraction."
  exit 0
fi

# Extract the zipped file
unzip "$filename" -d /tmp

# Check if extraction was successful
if [[ $? -ne 0 ]]; then
  echo "Error extracting the zip file."
  exit 1
fi

# Find the executable file inside the extracted directory
executable_file="/tmp/$(find /tmp -type f -executable)"

# Check if an executable file was found
if [[ ! -f "$executable_file" ]]; then
  echo "No executable file found in the extracted directory."
  exit 1
fi

# Move the executable file to /usr/local/bin
sudo mv "$executable_file" /usr/local/bin

# Make the moved file executable
sudo chmod +x /usr/local/bin/$(basename "$executable_file")

echo "Successfully downloaded, extracted, and installed the file."

