" My .vimrc
" Ondřej Sluka https://github.com/ondras12345

if v:progname =~? "evim"
  finish  " bail out
endif

set nocompatible

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" https://stackoverflow.com/questions/446269/can-i-use-space-as-mapleader-in-vim
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader = " "

silent! source $HOME/.vim/vimrc-local-pre

" Set plugins_programming to 1 in vimrc-local-pre where needed.
let g:plugins_programming = get(g:, 'plugins_programming', 0)

" Vundle Plugins {{{1
" This should be handled by a git submodule in my dotfiles repo:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" TODO Vundle is dead, switch to vim-plug or native packages
if isdirectory($HOME . "/.vim/bundle/Vundle.vim")
    filetype off " required by Vundle

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()  " Keep Plugin commands between vundle#begin/end.
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required

    Plugin 'VundleVim/Vundle.vim'

    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-eunuch'

    Plugin 'airblade/vim-gitgutter'
    Plugin 'xxdavid/bez-diakritiky.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'mhinz/vim-startify'
    Plugin 'SirVer/ultisnips'

    Plugin 'dbmrq/vim-ditto'

    Plugin 'preservim/vim-markdown'
    Plugin 'https://gitlab.com/dbeniamine/todo.txt-vim'

    " plugins_programming plugins {{{2
    if (g:plugins_programming)
        Plugin 'nvie/vim-flake8'
        Plugin 'ericcurtin/CurtineIncSw.vim'
        Plugin 'mattn/emmet-vim'
        Plugin 'ap/vim-css-color'

        Plugin 'ycm-core/YouCompleteMe'
        "cd ~/.vim/bundle/YouCompleteMe
        "./install.py --clangd-completer --rust-completer --java-completer
        " Do NOT do this:
        "sudo apt install vim-youcompleteme
        "vim-addon-manager install youcompleteme

        if executable("javac")
            Plugin 'puremourning/vimspector'
            " :VimspectorInstall!
            " put config in ~/.vim/ftplubin/java.vim
        endif
    endif

    " LaTeX plugins {{{2
    if executable("pdflatex")
        Plugin 'lervag/vimtex'
    endif

    " Color schemes {{{2
    Plugin 'dracula/vim'
    Plugin 'cormacrelf/vim-colors-github'

    " TODO take a look at these plugins {{{2
    " TODO https://github.com/godlygeek/tabular

    " This plugin causes problems when I open a python file from vim in Git
    " bash on Windows
    "Plugin 'dbeniamine/cheat.sh-vim'

    "Plugin 'masukomi/vim-markdown-folding'  " folds badly

    " This caused some trouble, but I can't remember what.
    "Plugin 'Yggdroot/indentLine'

    " Nice, but Netrw is not all that bad
    "Plugin 'vifm/vifm.vim'

    " Vundle post init {{{2
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
" }}}1

" Add optional packages. {{{1
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
" }}}1

" GENERAL CONFIG {{{1
set nojoinspaces " french spacing
language en_US.utf8

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

set number  " line numbers

set encoding=utf8

if exists('+colorcolumn')
    set colorcolumn=80,100,120
endif

" Show non-printing characters {{{2
" https://stackoverflow.com/questions/12814647/showing-single-space-invisible-character-in-vim
set list
set listchars=nbsp:␣,trail:•,tab:>▸
",eol:¶,precedes:«,extends:»

" Mouse support {{{2
if has('mouse')
  set mouse=a
endif

" better tab completion {{{2
set wildmode=longest,list,full
set wildmenu

" Search {{{2
" Smart case search
set ignorecase
set smartcase

" Disable search wrap
" This should make it easier for me to do replace with confirm
set nowrapscan

" backup & undofile {{{2
if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set backup  " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile  " keep an undo file (undo changes after closing)
  endif
endif

" hlsearch if available {{{2
if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Indentation settings {{{2
" Use 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " disable me if you want hard tabs
set smarttab

" Block cursor in normal mode {{{2
if !has("gui_running")
    " Originally added because of git bash, but it also appears to work on linux
    " It uses xterm escape sequences
    " https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
    " https://superuser.com/questions/634326/how-can-i-get-a-block-cursor-in-vim-in-the-cygwin-terminal
    " Use "\e[2 q" instead of "\e[1 q" for non-blinking block cursor
    " Use "\e[6 q" instead of "\e[5 q" for non-blinking bar cursor
    let &t_ti.="\e[2 q"
    let &t_SI.="\e[6 q"
    let &t_EI.="\e[2 q"
    let &t_te.="\e[0 q"
else
    set guicursor+=n:blinkon0
endif

" Man pages {{{2
runtime ftplugin/man.vim

" Disable vimHints {{{2
" You discovered the command-line window! You can close it with ":q".
silent! au! vimHints
" GENERAL CONFIG }}}1

" Workarounds {{{1
" dracula {{{2
" listchars were pink. This needs to be done before setting colorscheme.
" https://github.com/dracula/vim/pull/252
augroup dracula_customization
    au!
    autocmd ColorScheme dracula hi! link SpecialKey DraculaSubtle
augroup END
" Workarounds }}}1

" GUI settings {{{
if has("gui_running")
    set guioptions-=T  " hide the toolbar
    "set viminfofile=$HOME/.viminfo  " share .viminfo
    set guifont=Ubuntu\ Mono\ 12

    " Open on the left half of the screen
    set lines=84 columns=157
    winpos 0 0
    color dracula
endif
" }}}

" Autocmds {{{1
augroup vimrcEx
  au!

  " spell & textwidth in markdown & text {{{2
  autocmd FileType markdown,text
    \ setlocal textwidth=78 |
    \ setlocal spell |
    \ setlocal spelllang=en,cs,csa

  " Ceske uvozovky (UTF-8) {{{2
  "autocmd FileType markdown,text
  "  \ imap <buffer> "" „|
  "  \ imap <buffer> """ “

  " spell in gitcommit {{{2
  au FileType gitcommit
    \ setlocal spell |
    \ setlocal spelllang=en

  " Python {{{2
  " https://realpython.com/vim-and-python-a-match-made-in-heaven/
  " TODO use FileType instead ?
  au BufNewFile,BufRead *.py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=78 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix |
    \ setlocal spell |
    \ setlocal spelllang=en

  " c, cpp & arduino {{{2
  au FileType arduino,cpp,c
    \ setlocal spell |
    \ setlocal spelllang=en


  " Arduino & cpp - switch to header / cpp file {{{2
  " https://vim.fandom.com/wiki/Easily_switch_between_source_and_header_file
  au FileType arduino,cpp,c
    \ nnoremap <buffer> <Leader>oo :if expand('%:e') == "h" \| e %<.cpp \| else \| e %<.h \| endif<CR> |
    \ nnoremap <buffer> <Leader>oO :if expand('%:e') == "h" \| vs %<.cpp \| else \| vs %<.h \| endif<CR> |
    \ nmap <buffer> <Leader>OO <Leader>oO
    "\ nnoremap <buffer> <Leader>oo :call CurtineIncSw()<CR> |


  " html, php & markdown {{{2
  au FileType html,php,markdown
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2 |
    \ setlocal spell

  " yaml {{{2
  au FileType yaml
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2

  " manpages {{{2
  au FileType man
    \ setlocal nolist

  " fix todo.txt mappings conflicting with paste shortcut {{{2
  " (these are used for changing the due date; I have prefixed them with
  " <localleader>t
  "
  " Omnifunc - <C-x><C-o>
  au FileType todo
    \ nunmap <buffer> <localleader>p|
    \ nmap <silent> <buffer> <localleader>tp <Plug>TodotxtIncrementDueDateNormal|
    \ vunmap <buffer> <localleader>p|
    \ vmap <silent> <buffer> <localleader>tp <Plug>TodotxtIncrementDueDateVisual|
    \ nunmap <buffer> <localleader><S-P>|
    \ nmap <buffer> <localleader>tP <Plug>TodotxtDecrementDueDateNormal|
    \ vunmap <buffer> <localleader><S-P>|
    \ vmap <buffer> <localleader>tP <Plug>TodotxtDecrementDueDateVisual|
    \ setlocal omnifunc=todo#Complete
  " }}}2

augroup END
" }}}1

" WINDOW SPLITS {{{
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>w <C-w>
cnoreabbrev <expr> vsv (getcmdtype() == ':') ? "vert sv" : "vsv"
cnoreabbrev <expr> vterm (getcmdtype() == ':') ? "vert term" : "vterm"
" }}}

" MISC mappings {{{1
" :;; to enter q: command line history
" https://superuser.com/questions/470727/how-to-paste-yanked-text-to-vim-command-line
"nnoremap ; :
cnoremap ;; <c-f>

" see :h Y
nnoremap Y y$

" :bb lists buffers and types :b
"cmap bb buffers<CR>:b
nnoremap <leader>b :buffers<CR>:b

" Nbsp C-S-Space
"imap <C-S-Space> <C-V>u00a0
imap <C-S-Space>  

" space-space goes down
nmap <leader><leader> <C-F>
vmap <leader><leader> <C-F>

" Normal mode command to write file
nmap <leader>u :up<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <leader><C-L> :nohl<CR><C-L>

command Czmap :source ~/scripts/cz-mappings-local.vim

" Leader y and p system clipboard {{{2
nmap <leader>p "+p
vmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>P "+P
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>Y "+Y
vmap <leader>Y "+Y
nmap <leader>d "+d
vmap <leader>d "+d
nmap <leader>D "+D
vmap <leader>D "+D

" :make with <leader>m {{{2
nmap <leader>m :make<CR>
command PioMake
    \ nmap <lt>leader>mm :make<CR>|
    \ nmap <lt>leader>mu :make! upload<CR>|
    \ nmap <lt>leader>mc :make! check<CR>|
    \ nmap <lt>leader>mt :make! test<CR>|
    \ nunmap <lt>leader>m
" MISC mappings }}}1

" PLUGIN CONFIG {{{1
" airline {{{2
set laststatus=2

" gitgutter {{{2
"let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'

" netrw {{{2
let g:netrw_liststyle = 3
" All of ~, \~, and \\~ caused errors - probably bug somewhere in netrw logic
" to invert regex rules (press a key to cycle through inverted modes)
" [~] is a workaround
let g:netrw_list_hide='.*\.un[~]$,^\..*\.swp$,\..*[~]$'

" open browser links (gx)
" https://vi.stackexchange.com/questions/5032/gx-not-opening-url-in-gvim-but-works-in-terminal/5034#5034
let g:netrw_browsex_viewer= "setsid xdg-open"

" youcompleteme
" Do not pop up when idle in normal mode
let g:ycm_auto_hover=""
nmap <leader>K <plug>(YCMHover)
nmap <leader>gd :YcmCompleter GoTo<CR>

" vimspector {{{2
let g:vimspector_base_dir=$HOME.'/.vim/bundle/vimspector'
" this didn't seem to work, needed to do this instead:
" cd ~/.vim/bundle/vimspector
" ./install_gadget.py --force-enable-java --update-gadget-config
"let g:vimspector_install_gadgets = [ 'java-debug-adapter' ]

let g:vimspector_enable_mappings='HUMAN'
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval

" Tell YCM where to find the plugin.
let g:ycm_java_jdtls_extension_path = [
  \ '~/.vim/bundle/vimspector/gadgets/linux'
  \ ]


"" indentLine {{{2
"let g:indentLine_fileTypeExclude = ['markdown,tex']

" syntax for amsmath in LaTeX {{{2
" http://www.drchip.org/astronaut/vim/vbafiles/amsmath.vba.gz
" do NOT install this, it seems to conflict with vimtex

" Disable syntax highlight in lstlisting environment in LaTeX {{{2
" (solves problems with '$' characters, etc.)
" http://www.drchip.org/astronaut/vim/vbafiles/lstlisting.vba.gz

" vim-ditto {{{2
" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
"au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto           " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto           " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
"nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" vim-startify {{{2
let g:startify_bookmarks = [
    \ {'V': '~/.vimrc'},
    \ {'Z': '~/.zshrc'},
    \ {'L': '~/Documents/LAB/'},
    \ {'S': '~/source/repos/'},
    \ {'T': '~/Documents/notes/todo.txt'},
    \ {'N': '~/Documents/notes/index.md'},
    \ {'I': '~/Documents/notes/linux/install/$HOST.md'},
    \ ]

nnoremap <leader>S :Startify<CR>

" vim-markdown {{{2
" folding was too slow in insert mode
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_level = 2
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_auto_insert_bullets = 0
"let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_math = 1

" vimtex {{{2
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

" ultisnips {{{2
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" noweb {{{2
au BufRead,BufNewFile *.m.nw let noweb_language = "matlab"
" cannot move to ~/.vim/ftdetect/nw.vim, need to set noweb_language first
au BufRead,BufNewFile *.nw set filetype=noweb
let noweb_backend = "tex"
let noweb_fold_code = 1
" plugin config }}}1

" Source the machine-specific vimrc (does not need to exist)
" legacy
let s:vimrc_local_legacy=$HOME."/.vimrc-local"
if filereadable(s:vimrc_local_legacy)
    silent! execute "source " . s:vimrc_local_legacy
    echoerr "You are using legacy .vimrc-local."
endif
" new
silent! source $HOME/.vim/vimrc-local-post

" vim: foldmethod=marker
