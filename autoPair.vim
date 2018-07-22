" 括号引号补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i

" https://blog.csdn.net/zcube/article/details/42325815
inoremap " <c-r>=CloseQuote('"')<CR>
inoremap ' <c-r>=CloseQuote("'")<CR>

function CloseQuote(quote)
    echom a:quote
    let le = getline('.')
    let col = col('.')
    if le[col - 2] != a:quote
        return a:quote.a:quote."\<Esc>i"
    else
        return
    endif
endfunction

