import os, sys

files = os.listdir()
print(files)
counter = 1

for file in files:
    if file[-4:] == '.mp3':
        os.rename(file, "{0}.mp3".format(counter))
        counter += 1