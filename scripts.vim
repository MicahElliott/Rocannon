" Want to use ftdetect/ansible.vim, but seems the only way to detect file
" contents is to put the getline() into a scripts.vim file.

" autocmd BufNewFile,BufRead *.ans set filetype=ansible

" echom 'detecting if ansible filetype'
" echom 'second line:' . getline(2)
if did_filetype()
  finish
endif
if getline(1) =~ '^---$'
  setfiletype ansible
endif
