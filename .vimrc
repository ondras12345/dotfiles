
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " # Ondra
  " Do the same thing for markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=78

  " https://realpython.com/vim-and-python-a-match-made-in-heaven/
  au BufNewFile,BufRead *.py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=78 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" # Ondra
" https://vim.fandom.com/wiki/Example_vimrc
"
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm


" English
language en_US.utf8

" Line numbers
set nu

" DOS line endings
set ffs=dos,unix

" Block cursor in normal mode
" Originally added because of git bash, but it also appears to work on linux
" It uses xterm escape sequences
" https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
" https://superuser.com/questions/634326/how-can-i-get-a-block-cursor-in-vim-in-the-cygwin-terminal
" "\e[2 q" instead of "\e[1 q" for non-blinking block cursor
" "\e[6 q" instead of "\e[5 q" for non-blinking bar cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Ceska jmena souboru
set enc=utf8
" https://blog.root.cz/petrkrcmar/jak-si-spravne-nastavit-vimrc/
"set fileencodings=utf-8,latin2

" 80 chars mark
" https://superuser.com/questions/249779/how-to-setup-a-line-length-marker-in-vim-gvim
if exists('+colorcolumn')
    highlight ColorColumn ctermbg=gray
    set colorcolumn=80
endif

" :;; to enter q: command line history
" https://superuser.com/questions/470727/how-to-paste-yanked-text-to-vim-command-line
cnoremap ;; <c-f>

" Highlight no break space
" https://stackoverflow.com/questions/12814647/showing-single-space-invisible-character-in-vim
set list
set listchars=nbsp:␣,trail:•,tab:>▸
",eol:¶,precedes:«,extends:»
