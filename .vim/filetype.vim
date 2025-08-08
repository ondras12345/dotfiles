" http://wiki.linuxcnc.org/cgi-bin/wiki.pl?Highlighting_In_Vim
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.ngc		setfiletype ngc
augroup END
