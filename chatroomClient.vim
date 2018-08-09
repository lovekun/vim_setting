command! -nargs=0 ChatRoom :call WindowOpen()
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
function! WindowOpen()
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
    ""set nolazyredraw
    let &cmdheight = 6
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
        g:selection += 1
    elseif a:key == 'k'
        echo 'k'
    endif
    return 0
endfunc
