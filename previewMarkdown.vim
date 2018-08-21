command! -nargs=0 Preview :call Preview()

function! Preview()
python << EOF
# -*- coding: UTF-8 -*-
import httplib, urllib
import vim
import chardet
conn = httplib.HTTPConnection("localhost:3000")
params = urllib.urlencode({'url': vim.current.buffer.name})
print chardet.detect(params)
headers = {"Content-type": "application/x-www-form-urlencoded", "Accept": "text/plain"}
conn.request("POST", "/", params, headers)
# conn.request("POST", "/", {'url': vim.current.buffer.name}, headers)
EOF
endfunc

