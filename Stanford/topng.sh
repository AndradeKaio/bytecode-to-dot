#!/bin/bash

# Directory containing the dot files
DIRECTORY=$1

# Check if directory is provided
if [ -z "$DIRECTORY" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory $DIRECTORY does not exist."
  exit 1
fi

# Iterate over all .dot files in the directory
for dot_file in "$DIRECTORY"/*.dot; do
  if [ -f "$dot_file" ]; then
    # Get the base name without the extension
    base_name=$(basename "$dot_file" .dot)
    # Generate the PNG file
    dot -Tpng "$dot_file" -o "$DIRECTORY/$base_name.png"
    echo "Generated: $DIRECTORY/$base_name.png"
  else
    echo "No .dot files found in the directory."
  fi
done
