let g:inkscape_imgdir = 'img'

function! ink#Ink(image)
    let l:basepath = expand('%:p:h')
    let l:dirpath = l:basepath . '/' . g:inkscape_imgdir . '/'
    let l:imgpath = l:dirpath . a:image . '.svg'
    if filereadable(l:imgpath)
        echoerr 'image file already exists'
        return
    endif
    call mkdir(l:dirpath, 'p')
    if filereadable($HOME . '/.config/inkscape/templates/default.svg')
        exe '!cp -n ~/.config/inkscape/templates/default.svg ' . l:imgpath
    elseif filereadable('/usr/share/inkscape/templates/default.svg')
        exe '!cp -n /usr/share/inkscape/templates/default.svg ' . l:imgpath
    else
        echoerr 'no inkscape template'
        return
    endif
    call append(line('.'), '![' . a:image . '](' . l:imgpath . ')')
    normal jo

    call system('inkscape ' . l:imgpath . ' >/dev/null 2>&1 &')
endfunction
