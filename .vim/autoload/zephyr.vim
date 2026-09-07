function zephyr#GetFwRoot()
    if isdirectory("./build/firmware")
        " we are using sysbuild
        return "./build/firmware/zephyr"
    else
        " no sysbuild
        return "./build/zephyr"
    endif
endfunction

function zephyr#ShowConfig()
    execute "sview" zephyr#GetFwRoot() . "/.config"
endfunction

function zephyr#ShowDts()
    execute "sview" zephyr#GetFwRoot() . "/zephyr.dts"
endfunction

function zephyr#ShowDth()
    execute "sview" zephyr#GetFwRoot() . "/include/generated/zephyr/devicetree_generated.h"
endfunction

function zephyr#Build(...)
    if !filereadable('prj.conf')
        echoerr 'this does not look like a zephyr repo root'
        return
    endif
    let l:command = 'west build'
    if filereadable('sysbuild.conf')
        let l:command = l:command . ' --sysbuild .'
    endif
    let l:command = l:command . ' ' . join(a:000, ' ')
    "echo l:command
    execute "!" . l:command
endfunction
