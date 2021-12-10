from urllib import parse
import sys


# take stdin
for url in sys.stdin:
    if 'q' == url.rstrip():
        break


print(parse.urlsplit(url).path)