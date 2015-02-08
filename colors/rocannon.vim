" Vim color file with Ansible support
" Maintainer: Micah Elliott <mde@micahelliott.com>

" This color scheme uses a dark background.
"
" TODO: support light background

" Rocannon is the operator of the Ansible.

"set background=light
"set background=dark
"ec 'background:' . &background | sleep 1

hi clear  " no, bad!! maybe breaks airline
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "rocannon"  " maybe bad

" Maybe these are needed for things like help?
"hi Keyword     ctermfg=64 cterm=bold
hi Comment    ctermfg=59
"hi Label ctermfg= cterm=
"hi SpecialChar ctermfg= cterm=
"hi Conditional ctermfg= cterm=
"hi Function ctermfg= cterm=
"hi Tags ctermfg= cterm=
"hi Repeat ctermfg= cterm=
"hi Define ctermfg= cterm=
"hi Exception ctermfg= cterm=
"hi Macro ctermfg= cterm=
"hi StorageClass ctermfg= cterm=
"hi Typedef ctermfg= cterm=
"hi Identifier ctermfg= cterm=
"hi Boolean ctermfg= cterm=
"hi Operator ctermfg= cterm=
hi HelpHeadline ctermfg=blue cterm=bold
" Not working. Want it to look like ansAction
hi HelpStar ctermfg=120 ctermbg=22 cterm=bold

hi ansDirective ctermfg=93 cterm=bold

" Colors sensitive to background
if &background == 'light'
  ec 'hmm, background set to light' | sleep 1
  hi Normal      ctermfg=black ctermbg=white
  hi ansNameKey  ctermfg=232 cterm=bold,underline
  hi ansNameLine ctermfg=232 cterm=bold,underline
  hi ansNameText ctermfg=232 cterm=italic,underline
  hi Folded      ctermfg=232 ctermbg=254 cterm=bold
  hi IndentGuidesOdd  ctermbg=254
  hi IndentGuidesEven ctermbg=255
else  " dark
  hi Normal      ctermfg=white ctermbg=232
  hi ansNameKey  ctermfg=white cterm=bold,underline
  hi ansNameLine ctermfg=white cterm=bold,underline
  hi ansNameText ctermfg=white cterm=italic,underline
  hi Folded      ctermfg=white ctermbg=235 cterm=bold
  hi IndentGuidesOdd  ctermbg=233
  hi IndentGuidesEven ctermbg=234
endif

hi ansParam   ctermfg=32 cterm=italic
hi ansWhen    ctermfg=130 cterm=none
hi ansNotify  ctermfg=178 cterm=bold
hi ansNotifyStep  ctermfg=178 cterm=none
hi ansTmpl    ctermfg=70 cterm=none
hi ansTags    ctermfg=37 cterm=none
hi ansWith    ctermfg=105 cterm=none
hi ansItem    ctermfg=105 cterm=bold
hi ansReg     ctermfg=130 cterm=none
hi ansRegVar  ctermfg=130 cterm=bold
hi ansIgnore  ctermfg=124 cterm=none

hi ansSpecials ctermfg=87 cterm=bold ctermbg=20
hi ansParallel ctermfg=87 cterm=none
hi ansTargets  ctermfg=22 cterm=bold ctermbg=none
hi ansKeyword  ctermfg=64 cterm=bold
hi ansEnvVar   ctermfg=191 cterm=bold

hi ansNumber ctermfg=120

hi ansAction ctermfg=120 ctermbg=22 cterm=bold

hi ansComment ctermfg=59

hi PmenuSel ctermfg=blue ctermbg=white cterm=bold

" :help fold-text
" http://stackoverflow.com/questions/5983396/change-the-text-in-folds
"set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
"set foldtext=substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
" Learn more about 'fillchars', 'foldtext'
set foldtext=FoldTaskBlock()
fun! FoldTaskBlock()
  let line = getline(v:foldstart)
  "let sub  = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let sub  = substitute(line, '- name: ', '· ', 'g')
  "return v:folddashes . sub
  return sub . ' '
endfun

set fillchars=fold:·

"set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
