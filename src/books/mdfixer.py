# Go inside the folder 'premchand' and iterate over all the files. Start from line no 9 and after every line which is not empty, put a '\' at the end of the line.

import os
import sys

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 mdfixer.py <folder>")
        sys.exit(1)
    folder = sys.argv[1]
    for filename in os.listdir(folder):
        if filename.endswith(".md"):
            print(filename)
            with open(os.path.join(folder, filename), 'r') as f:
                lines = f.readlines()
            with open(os.path.join(folder, filename), 'w') as f:
                for line in lines:
                    if line.strip() != "":
                        line = line.strip() + "  \n"
                    f.write(line)

if __name__ == "__main__":
    main()
