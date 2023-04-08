#!/bin/bash

# Read the .gitignore file
while IFS= read -r line; do
  # Check if line starts with "eos/"
  if [[ $line == "eos/"* ]]; then
    # Check if line ends with a "/"
    if [[ $line != */ ]]; then
      # Check if line has a "." before the last 1 to 4 characters
      if [[ $line != *.[a-zA-Z]{1,4} ]]; then
        # Append "/" at the end of the line
        line="$line/"
      fi
    fi

    # Duplicate the line to end with "/*"
    line="$line"$'\n'"$line"*

  fi

  # Print the updated line
  echo "$line"

done < .gitignore > .gitignore.tmp

# Replace the .gitignore file with the updated content
mv .gitignore.tmp .gitignore

echo "Updated .gitignore file successfully!"
