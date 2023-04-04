" TODO carka/hacek zvlast
" ů vs ;
setlocal spelllang=cs

let s:mappings = {
    "\ '1': '+',
    \ '2': 'ě',
    \ '3': 'š',
    \ '4': 'č',
    \ '5': 'ř',
    \ '6': 'ž',
    \ '7': 'ý',
    \ '8': 'á',
    \ '9': 'í',
    \ '0': 'é',
    \ 'ě': '2',
    \ 'š': '3',
    \ 'č': '4',
    \ 'ř': '5',
    \ 'ž': '6',
    \ 'ý': '7',
    \ 'á': '8',
    \ 'í': '9',
    \ 'é': '0',
    "\ '+': '1',
    \ }

let b:CzMapState = get(b:, 'CzMapState', 0)

if b:CzMapState

    for [mf, mt] in items(s:mappings)
        execute "iunmap <buffer> " . mf
        execute "nunmap <buffer> r" . mf
        execute "nunmap <buffer> f" . mf
        execute "nunmap <buffer> F" . mf
    endfor

    echo "Czmap unmapped"
else
    for [mf, mt] in items(s:mappings)
        execute "inoremap <buffer> " . mf . " " . mt
        execute "nnoremap <buffer> r" . mf . " r" . mt
        execute "nnoremap <buffer> f" . mf . " f" . mt
        execute "nnoremap <buffer> F" . mf . " F" . mt
    endfor
endif

let b:CzMapState = !b:CzMapState
