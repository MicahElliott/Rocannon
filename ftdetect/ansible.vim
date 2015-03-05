" Ansible only recognizes its files as .yml, .yaml, or suffix-less.

autocmd BufNewFile,BufRead *.ans set filetype=ansible
" HACK: YAML file are usually suffixed .yml, but for suffix .yaml we'll treat
"       the 'a' as meaning ansible!
autocmd BufNewFile,BufRead *.yaml set filetype=ansible

" Does not work in this file; needs to be in ../scripts.vim to see contents.
"if getline(1) =~ '^---$' | setfiletype ansible | endif

" Could get more sophisticated in detection if needed, like:
" https://github.com/chase/vim-ansible-yaml/blob/master/ftdetect/ansible.vim
