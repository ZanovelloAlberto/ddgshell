from urllib import parse
import sys
# https://github.com/ZanovelloAlberto/ddgshell

# take stdin
for url in sys.stdin:
    if 'q' == url.rstrip():
        break

splitted = parse.urlsplit(url).path.split("/")


print(splitted)

print("OWNER=")

