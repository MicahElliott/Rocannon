" Vim filetype plugin file
" Language:         Ansible
" Maintainer:       Micah Elliott

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Enable completions
setlocal omnifunc=rocannon#CompleteAnsible

" Color Scheme
if !exists('g:rocannon_bypass_colorscheme')
  let g:rocannon_bypass_colorscheme = 0
endif
if g:rocannon_bypass_colorscheme != 1
  " Set up highlights specific to ansible
  colorscheme rocannon
endif

" Built-in help
set keywordprg=:help
