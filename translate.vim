function! Translate()
python << EOF
#/usr/bin/env python
# -*- coding: UTF-8 -*-
 
import httplib
import md5
import urllib
import random
import json
import vim

word = vim.current.line

appid = '20180804000191677' #你的appid
secretKey = 'a47fHGMFOkn7b99zSMGz' #你的密钥
 
httpClient = None
myurl = '/api/trans/vip/translate'
# q = 'translate'
# q = vim.eval("a:word")
q = word
fromLang = 'en'
toLang = 'zh'
salt = random.randint(32768, 65536)

sign = appid+q+str(salt)+secretKey
m1 = md5.new()
m1.update(sign)
sign = m1.hexdigest()
myurl = myurl+'?appid='+appid+'&q='+urllib.quote(q)+'&from='+fromLang+'&to='+toLang+'&salt='+str(salt)+'&sign='+sign
 
try:
    httpClient = httplib.HTTPConnection('api.fanyi.baidu.com')
    httpClient.request('GET', myurl)
 
    #response是HTTPResponse对象
    response = httpClient.getresponse()
    # print response.read().encode('latin-1').decode('unicode_escape')
    print json.loads(response.read()).get('trans_result')[0].get('dst')


except Exception, e:
    print e
finally:
    if httpClient:
        httpClient.close()
EOF
endfunction

nnoremap <leader>t :call Translate()<cr>

