" Various utils for C/C++ using compile_commands.json
"
function ccomp#preprocess(file) abort
    if !filereadable('compile_commands.json')
        echoerr 'compile_commands.json does not exist'
        return
    endif

    let l:cmds = json_decode(join(readfile('compile_commands.json'), "\n"))
    let l:filepath = fnamemodify(a:file, ':p')
    " find the matching cmds entry
    let l:entry = get(filter(l:cmds, {_, v -> fnamemodify(v.file, ':p') ==# l:filepath}), 0, {})
    let l:cmd = l:entry.command
    " Remove -c
    let l:cmd = substitute(l:cmd, '\(^\| \)-c\($\| \)', ' ', 'g')
    " Remove -o <outfile>
    let l:cmd = substitute(l:cmd, '\(^\| \)-o\s\+\S\+', '', 'g')
    " Preprocess to stdout
    let l:cmd .= ' -E -o -'

    let l:shellcmd = 'cd ' . shellescape(l:entry.directory) . ' && ' . l:cmd
    let l:output = systemlist(l:shellcmd)
    if v:shell_error
        echoerr 'preprocessor failed: ' . v:shell_error
        echo l:shellcmd
        return
    endif

    new
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal filetype=c
    call setline(1, l:output)
endfunction
