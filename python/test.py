from urllib import parse
url = "http://www.example.org/default.html?ct=32&op=92&item=98"
print(parse.urlsplit(url).path)