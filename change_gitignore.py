import re

def modify_line(line):
    # Ignore lines that do not start with a number or letter
    if not line[0].isalnum():
        return line

    # Use regex to check if the line ends with a "." followed by 1-4 characters
    if re.match(r'^.*\.[A-Za-z0-9]{1,4}$', line):
        # Append "/" and "/*" to the line
        return line
    else:
        return f"{line}/\n{line}/*"

# File path
file_path = ".gitignore"

# Read lines from file
with open(file_path, 'r') as file:
    lines = file.readlines()

# Modify lines in-place
for i in range(len(lines)):
    lines[i] = modify_line(lines[i])

# Write modified lines back to file
with open(file_path, 'w') as file:
    file.writelines(lines)
