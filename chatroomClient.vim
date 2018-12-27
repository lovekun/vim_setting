command! -nargs=0 ChatRoom :call WindowOpen()
command! -nargs=0 CreateServer :call CreateServer()
command! -nargs=1 TestServer :call TestServer(<f-args>)
command! -nargs=0 CloseServer :call CloseServer()
command! -nargs=1 Connect2Server :call Connect2Server(<f-args>)

"
"function! WindowOpen()
"    exec "silent! bo 10new ChatRoomConfig"
"    setlocal filetype=chatroom
"    setlocal buftype=nofile
"    setlocal bufhidden=hide
"    setlocal nobuflisted
"    setlocal noswapfile
"    setlocal nonumber
"    setlocal nowrap
"    setlocal noshowcmd
"    setlocal nolist
"    setlocal colorcolumn= nocursorline nocursorcolumn
"    setlocal nospell
"    setlocal signcolumn=no
"    setlocal textwidth=0
"    call AddMenuItem()
"endfunc
"
"function! AddMenuItem()
"    call append('', 'aaa')
"endfunc
"

let g:selection = 0
" 消息队列
let g:list = []
let g:start = 0
function! WindowOpen()
    set nolazyredraw
    let &cmdheight = 6
    try
        let l:done = 0
        while !l:done
            redraw!
            call FillMenu()
            let l:key = nr2char(getchar())
            let l:done = HandleKeyPress(l:key)
        endwhile
    finally
        let &cmdheight=1
    endtry
endfunc

function! FillMenu()
    set nolazyredraw
    echo 'config chat room'
    echo '========================'
    let l:menuItem = ['(p)connect to public room','(l)connect to local room','(c)create local room']
    for i in range(0, len(l:menuItem) - 1)
        if g:selection == i
            echo '> '.l:menuItem[i]
        else
            echo '  '.l:menuItem[i]
        endif
    endfor
endfunc

function! HandleKeyPress(key)
    if a:key == nr2char(27)
        return 1
    elseif a:key == 'j'
        let g:selection += 1
    elseif a:key == 'k'
        let g:selection -= 1
    endif
    return 0
endfunc

function! TestServer(msg)
    echo a:msg
python << EOF
import vim
# data = "123"
# vim.command("let g:list=" + data)
# vim.command("call add(g:list, " + data + ")")
# print vim.eval("g:list")

print vim.eval("a:msg")
print vim.eval("g:start") == 1
EOF
endfunc

function! CloseServer()
    g:start = 0
endfunc


function! CreateServer()
python << EOF
import socket
import threading
import time
import vim

def tcplink(sock, addr):
    print 'Accept new connection from %s:%s...' % addr
    sock.send('Welcome!')
    vim.command("let &cmdheight = 10")
    while True:
        data = sock.recv(1024)
        f = open('E:/chatroom.txt', 'a')
        f.write(data)
        f.close()
        # vim.command("call add(g:list, " + data + ")")
        # print vim.eval("g:list")
        # vim.command("echo " + data)
        # print data
        time.sleep(1)
        if data == 'exit' or not data:
            break
        sock.send('Hello, %s!' % data)
    sock.close()
    print 'Connection from %s:%s closed.' % addr

def init():
    time.sleep(3)
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('127.0.0.1', 8989))
    s.listen(5)
    print 'Waiting for connection...'
    temp = (vim.eval("g:start") == 1)
    # print temp
    while True:
        flag = 1
        sock, addr = s.accept()
        # t = threading.Thread(target=tcplink, args=(sock, addr))
        # t.start()
        print 'Accept new connection from %s:%s...' % addr
        sock.send('Welcome!')
        while True:
            data = sock.recv(1024)
            f = open('E:/chatroom.txt', 'a')
            f.write(data)
            f.close()
            time.sleep(1)
            print data
            if data == 'exit' or not data:
                flag = 0
                break
            sock.send('Hello, %s!' % data)
        sock.close()
        print 'Connection from %s:%s closed.' % addr
        if flag == 0:
            break

vim.command("let g:start=1")
t0 = threading.Thread(target=init)
t0.start()

EOF
endfunc

function! Connect2Server(msg)
python << EOF
import socket
import vim
import threading

def conn2Server(data):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('127.0.0.1', 8989))
    print s.recv(1024)
    s.send(data)
    print s.recv(1024)
    s.send('exit')
    s.close()
    print data

t = threading.Thread(target=conn2Server, args=(vim.eval("a:msg"),))
t.start()

EOF
endfunc

" 回调函数
func! Handler(channel, msg)
    echom a:msg
endfunc

" 执行job
func! GetDate()
    echom "aaa"
    "call job_start(['/bin/bash', '-c', 'sleep 5s; date'], {'callback': 'Handler'})
    "call job_start('ping -n 3 127.0.0.1', {'callback': 'Handler'})
    call job_start('python test.py', {'callback': 'Handler'})
endfunc

nnoremap <F3> :call GetDate()<cr>

func! MyHandler(timer)
	echom 'Handler called'
    edit!
endfunc
""let timer = timer_start(5000, 'MyHandler', {'repeat': 200})

