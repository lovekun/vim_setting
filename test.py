# -*- coding: UTF-8 -*-

import httplib, urllib
conn = httplib.HTTPConnection("localhost:3000")
# params = urllib.urlencode({'@type': 'issue', '@action': 'show'})
params = urllib.urlencode({'url': '/Users/lovekun/Documents/git/Notebook/python/python写vim插件--翻译.md'})
headers = {"Content-type": "application/x-www-form-urlencoded"
        , "Accept": "text/plain"}
conn.request("POST", "/", params, headers)
