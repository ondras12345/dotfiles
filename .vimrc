" My .vimrc
" Ondřej Sluka https://github.com/ondras12345
"
" Based on 'An example for a vimrc file.'
" Maintainer:  Bram Moolenaar <Bram@vim.org>

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif



set nocompatible


" https://stackoverflow.com/questions/446269/can-i-use-space-as-mapleader-in-vim
nnoremap <SPACE> <Nop>
let mapleader=" "


" This should be handled by a git submodule in my dotfiles repo:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if isdirectory($HOME . "/.vim/bundle/Vundle.vim")
    filetype off " required by Vundle

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    " Keep Plugin commands between vundle#begin/end.
    Plugin 'VundleVim/Vundle.vim'

    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'nvie/vim-flake8'
    Plugin 'xxdavid/bez-diakritiky.vim'
    Plugin 'ap/vim-css-color'
    "Plugin 'Yggdroot/indentLine'
    Plugin 'vim-airline/vim-airline'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'mhinz/vim-startify'
    Plugin 'ericcurtin/CurtineIncSw.vim'
    " This plugin causes problems when I open a python file from vim in Git
    " bash on Windows
    "Plugin 'dbeniamine/cheat.sh-vim'

    " Color schemes
    Plugin 'dracula/vim'
    Plugin 'cormacrelf/vim-colors-github'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
endif



" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set backup  " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile  " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " # Ondra
  autocmd FileType markdown,text
    \ setlocal textwidth=78 |
    \ setlocal spell |
    \ setlocal spelllang=en,cs,csa

  " Ceske uvozovky (UTF-8)
  autocmd FileType markdown,text
    \ imap <buffer> "" „|
    \ imap <buffer> """ “

  au FileType gitcommit
    \ setlocal spell |
    \ setlocal spelllang=en

  " https://realpython.com/vim-and-python-a-match-made-in-heaven/
  au BufNewFile,BufRead *.py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=78 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix


  au FileType arduino,cpp,c
    \ setlocal spell |
    \ setlocal spelllang=en


  " Arduino and cpp - switch to header / cpp file
  " https://vim.fandom.com/wiki/Easily_switch_between_source_and_header_file
  au FileType arduino,cpp,c
    \ nnoremap <buffer> <Leader>oo :call CurtineIncSw()<CR> |
    \ nnoremap <buffer> <Leader>oO :if expand('%:e') == "h" \| vs %<.cpp \| else \| vs %<.h \| endif<CR>
    "\ nnoremap <buffer> <Leader>oo :if expand('%:e') == "h" \| e %<.cpp \| else \| e %<.h \| endif<CR> |

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
set nojoinspaces " french spacing

" https://vim.fandom.com/wiki/Example_vimrc
"
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " disable me if you want hard tabs
set smarttab

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
"set confirm


" English
" TODO further investigate why I need this if statement
"if has("gui_running")
"    language en_US
"else
    language en_US.utf8
"endif

" Line numbers
set number

" DOS line endings
" WARNING Windows ONLY
"set ffs=dos,unix

" Block cursor in normal mode
if !has("gui_running")
    " Originally added because of git bash, but it also appears to work on linux
    " It uses xterm escape sequences
    " https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
    " https://superuser.com/questions/634326/how-can-i-get-a-block-cursor-in-vim-in-the-cygwin-terminal
    " Use "\e[2 q" instead of "\e[1 q" for non-blinking block cursor
    " Use "\e[6 q" instead of "\e[5 q" for non-blinking bar cursor
    let &t_ti.="\e[2 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[2 q"
    let &t_te.="\e[0 q"
else
    set guicursor+=n:blinkon0
endif

" Ceska jmena souboru
set enc=utf8
" https://blog.root.cz/petrkrcmar/jak-si-spravne-nastavit-vimrc/
"set fileencodings=utf-8,latin2

" 80 chars mark
" https://superuser.com/questions/249779/how-to-setup-a-line-length-marker-in-vim-gvim
if exists('+colorcolumn')
    set colorcolumn=80,100,120
endif

" :;; to enter q: command line history
" https://superuser.com/questions/470727/how-to-paste-yanked-text-to-vim-command-line
"nnoremap ; :
cnoremap ;; <c-f>

" :bb lists buffers and types :b
cmap bb buffers<CR>:b

" Highlight no break space
" https://stackoverflow.com/questions/12814647/showing-single-space-invisible-character-in-vim
set list
set listchars=nbsp:␣,trail:•,tab:>▸
",eol:¶,precedes:«,extends:»

" Mouse support
" Just testing this, maybe I'll disable it later. Commit separately!
if has('mouse')
  set mouse=a
endif

" Smart case search
set ignorecase
set smartcase

" Nbsp C-S-Space
"imap <C-S-Space> <C-V>u00a0
imap <C-S-Space>  

" Disable search wrap
" This should make it easier for me to do replace with confirm
set nowrapscan

" Leader y and p system clipboard
" Windows only?? - commit for now, fix in case of issues - probably not
"if has("gui_running")
    nmap <leader>p "+p
    vmap <leader>p "+p
    nmap <leader>P "+P
    vmap <leader>P "+P
    nmap <leader>y "+y
    vmap <leader>y "+y
"endif


if has("gui_running")
    set guioptions-=T  " hide the toolbar
    "set viminfofile=$HOME/.viminfo  " share .viminfo
    set guifont=Ubuntu\ Mono\ 12

    set lines=84 columns=160
    color dracula

    " unzip on Windows
    " Add Git/path to path and create symlinks to Git/usr/bin to make it work
    " (unzip.exe)
    "
    " This does not work:
    "let g:zip_unzipcmd="C:\Program Files\Git\usr\bin\unzip.exe"

    " TODO scp://
endif


" space-space goes down
nmap <leader><leader> <C-F>


"""""""""""""""""""""""""
" WINDOW SPLITS
"""""""""""""""""""""""""
" https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/nvim/init.vim
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>w <C-w>

command Czmap :source ~/scripts/cz-mappings-local.vim


"""""""""""""""""""""""""
" PLUGIN CONFIG
"""""""""""""""""""""""""
" airline
set laststatus=2

" gitgutter
"let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'

" netrw tree
let g:netrw_liststyle = 3

"" indentLine
"let g:indentLine_fileTypeExclude = ['markdown,tex']

" syntax for amsmath in LaTeX:
" http://www.drchip.org/astronaut/vim/vbafiles/amsmath.vba.gz

" Disable syntax highlight in lstlisting environment in LaTeX
" (solves problems with '$' characters, etc.)
" http://www.drchip.org/astronaut/vim/vbafiles/lstlisting.vba.gz
"
"
let g:startify_bookmarks = [
    \ {'V': '~/.vimrc'},
    \ {'I': '~/source/repos/ondra-HP/install'},
    \ {'R': '~/Documents/LAB/IT/rpi-lab/rpi-lab.sh'},
    \ {'L': '~/Documents/LAB/IT/pc1.lab-config.sh'},
    \ {'K': '~/source/repos/KOTEL/src/KOTEL_non-blocking/KOTEL_non-blocking.ino'}
    \ ]


" Source the machine-specific vimrc (does not need to exist)
silent! source $HOME/.vimrc-local
