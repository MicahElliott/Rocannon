" Vim filetype plugin file
" Language:         Ansible
" Maintainer:       Micah Elliott

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

set shiftwidth=2
set tabstop=2
set expandtab

" Okay for ansible to break 80-char/line rule; too annoying when auto-wraps
set textwidth=0

" Enable completions
setl omnifunc=rocannon#CompleteAnsible

" Dictionary-style completion of ansible keywords
setl complete+=k
" Not sure where to safely put this dict file, so hackishly abs-pathing it
"setl dict=anskeywords.txt
setl dict=~/.vim/bundle/Rocannon/dict/anskeywords.txt

" Bulk commenting is usually without spaces; doc comments are intentional and
" don't need commentary.
" https://github.com/tpope/vim-commentary/issues/33
setl commentstring=#%s
let b:commentary_format = '#%s'

" Gets typed so often
iab n: - name:
iab r: register:
iab w: with_items:
iab e: environment:
iab t: tags: [
iab #v # vim:ft=ansible:<C-r>=rocannon#Eatchar('\s')<CR>


" Color Scheme
if !exists('g:rocannon_bypass_colorscheme')
  let g:rocannon_bypass_colorscheme = 0
endif
if g:rocannon_bypass_colorscheme != 1
  " Set up highlights specific to ansible
  colorscheme rocannon
endif

""" Bouncing around (navigation)
if !exists('g:rocannon_open_action')
  let g:rocannon_open_action = 'split'
endif
let open_action = g:rocannon_open_action  " shorter for convenience herein

"command! AnsVars split %:p:h/../vars/main.yml
command! AnsVars split group_vars/all.yaml

" Inside role
command! RHandler  call rocannon#OpenAlternate(open_action, 'handlers')
command! RVars     call rocannon#OpenAlternate(open_action, 'vars')
command! RPlates   call rocannon#OpenAlternate(open_action, 'templates')
command! RTasks    call rocannon#OpenAlternate(open_action, 'tasks')
command! RFiles    call rocannon#OpenAlternate(open_action, 'files')
command! RDefaults call rocannon#OpenAlternate(open_action, 'defaults')
command! RMeta     call rocannon#OpenAlternate(open_action, 'meta')

" Any complexity means main is just a bunch of includes.
" RM would be nice for "M"ain but "M"eta might be more important
command! RIncludes exe open_action . expand('%:p:h') . '/main.yaml'

" Top level
command! Rglobals    split group_vars/all.yaml
command! Rsite       split site.yaml
command! Rinventory  split hosts
command! Rhosts      split hosts
command! Rrhosts     split ~/.ssh/config
command! Rconfig     split ~/.ansible.cfg

if exists('g:rocannon_bounce_mappings') && g:rocannon_bounce_mappings == 1
  " ec 'enabling rocannon_bounce_mappings'
  nnoremap <Leader>h :RH<CR>
  nnoremap <Leader>v :RV<CR>
  nnoremap <Leader>p :RP<CR>
  nnoremap <Leader>t :RT<CR>
  nnoremap <Leader>f :RF<CR>
  nnoremap <Leader>d :RD<CR>
  nnoremap <Leader>m :RM<CR>
endif

" Built-in help
set keywordprg=:help

set foldmethod=syntax

" Parse ansible-playbook output for use in quickfix list
" http://vim.wikia.com/wiki/Errorformats
" Really lame that ansible's error output is usually not parsable.
" https://github.com/ansible/ansible/issues/5797
" Some errors are useful, though:
"    ERROR: Syntax Error while loading YAML script, /home/mde/proj/Membean/provn/ansible/roles/appsvr/tasks/rubygems.yaml
"    Note: The error may actually appear before this position: line 18, column 3
"
"      foooooooo
"      when: not rg_r.stat.exists
set errorformat=%EERROR:\ %m\\,\ %f,%C%m:\ line\ %l\\,\ column\ %c

" Run ansible-playbook (with :mak)
set makeprg=ansible-playbook\ -u\ root\ -l\ orcs:172.17.0.2\ -k\ site.yaml\ -v\ -t\ vimcur
" Could have function to run ansible without tag (-t)

" Add a vimcur tag to enable single task run
nnoremap <Leader>r }kotags: [vimcur]<Esc>{jv}
