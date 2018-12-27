# -*- coding: UTF-8 -*-

import httplib, urllib
import chardet
conn = httplib.HTTPConnection("localhost:3000")
# params = urllib.urlencode({'url': '/Users/lovekun/Documents/git/Notebook/python/python写vim插件--翻译.md'})
params = urllib.urlencode({'url': 'E:\personal\git\Notebook\python\python写vim插件--翻译.md'})

urllib.pathname2url('E:\personal\git\Notebook\python\python写vim插件--翻译.md')
print chardet.detect(params)
headers = {"Content-type": "application/x-www-form-urlencoded", "Accept": "text/plain"}
conn.request("POST", "/", params, headers)
