" Vim color file with Ansible support

" Maintainer: Micah Elliott <mde@micahelliott.com>

" This color scheme uses a dark background.
" vim:ft=ctermhi:
"
" Rocannon is the operator of the Ansible.

"set background=light

"hi clear " no, bad!! maybe breaks airline
if exists("syntax_on")
" syntax reset
endif
let g:colors_name = "rocannon" " maybe bad

""" Standard Vim highlights {{{
" Maybe these are needed for things like help?
"hi Keyword guifg=#5f8700 ctermfg=64 gui=bold cterm=bold
hi Comment guifg=#5f5f5f ctermfg=59
"hi Label ctermfg= gui= cterm=
"hi SpecialChar ctermfg= gui= cterm=
"hi Conditional ctermfg= gui= cterm=
"hi Function ctermfg= gui= cterm=
"hi Tags ctermfg= gui= cterm=
"hi Repeat ctermfg= gui= cterm=
"hi Define ctermfg= gui= cterm=
"hi Exception ctermfg= gui= cterm=
"hi Macro ctermfg= gui= cterm=
"hi StorageClass ctermfg= gui= cterm=
"hi Typedef ctermfg= gui= cterm=
"hi Identifier ctermfg= gui= cterm=
"hi Boolean ctermfg= gui= cterm=
"hi Operator ctermfg= gui= cterm=
hi HelpHeadline ctermfg=blue gui=bold cterm=bold
" Not working. Want it to look like ansAction
hi HelpStar guifg=#87ff87 ctermfg=120 guibg=#005f00 ctermbg=22 gui=bold cterm=bold
hi HelpExample guifg=#949494 ctermfg=246
" }}}

""" Colors sensitive to background {{{
if &background == 'light'
echom 'WARNING: background set to light'
" hi Normal guifg=#080808 ctermfg=232
hi ansNameKey guifg=#080808 ctermfg=232 gui=bold,underline cterm=bold,underline
hi ansNameLine guifg=#080808 ctermfg=232 gui=bold,underline cterm=bold,underline
hi ansNameText guifg=#080808 ctermfg=232 gui=italic,underline cterm=italic,underline
hi Folded guifg=#080808 ctermfg=232 guibg=#e4e4e4 ctermbg=254 gui=bold cterm=bold
hi IndentGuidesOdd guibg=#e4e4e4 ctermbg=254
hi IndentGuidesEven guibg=#eeeeee ctermbg=255
else " dark
" Wow, awful that vim sees setting the Normal bg as a cause to reset
" 'background' to light.
" hi Normal ctermfg=white guibg=#080808 ctermbg=232
hi ansNameKey guifg=#eeeeee ctermfg=255 gui=bold,underline cterm=bold,underline
hi ansNameLine guifg=#eeeeee ctermfg=255 gui=bold,underline cterm=bold,underline
hi ansNameText guifg=#eeeeee ctermfg=255 gui=italic,underline cterm=italic,underline
hi Folded guifg=#eeeeee ctermfg=255 guibg=#262626 ctermbg=235 gui=bold cterm=bold
hi IndentGuidesOdd guibg=#121212 ctermbg=233
hi IndentGuidesEven guibg=#1c1c1c ctermbg=234
endif
" }}}

""" Ansible-specific {{{
hi ansAction guifg=#87ff87 ctermfg=120 guifg=Black gui=bold cterm=bold gui=bold guibg=#005f00 ctermbg=22 guibg=DarkGreen
hi ansSpecials guifg=#5fffff ctermfg=87 gui=bold cterm=bold guibg=#0000df ctermbg=20

hi ansParam guifg=#0087df ctermfg=32 gui=italic cterm=italic
hi PmenuSel guifg=#0087df ctermfg=32 gui=bold cterm=bold guibg=#eeeeee ctermbg=255
hi ansNotify guifg=#dfaf00 ctermfg=178 gui=bold cterm=bold
hi ansNotifyStep guifg=#dfaf00 ctermfg=178 gui=none cterm=none
hi ansTmpl guifg=#5faf00 ctermfg=70 gui=none cterm=none
hi ansTags guifg=#00afaf ctermfg=37 gui=none cterm=none
hi ansWith guifg=#8787ff ctermfg=105 gui=none cterm=none
hi ansItem guifg=#8787ff ctermfg=105 gui=bold cterm=bold
hi ansWhen guifg=#af5f00 ctermfg=130 gui=none cterm=none
hi ansReg guifg=#af5f00 ctermfg=130 gui=none cterm=none
hi ansRegVar guifg=#af5f00 ctermfg=130 gui=bold cterm=bold
hi ansIgnore guifg=#af0000 ctermfg=124 gui=none cterm=none
hi ansInclude guifg=#5fdfdf ctermfg=80 gui=bold cterm=bold

hi ansParallel guifg=#5fffff ctermfg=87 gui=none cterm=none
hi ansTargets guifg=#005f00 ctermfg=22 gui=bold cterm=bold
hi ansKeyword guifg=#5f8700 ctermfg=64 gui=bold cterm=bold
hi ansEnvBlock guifg=#dfff5f ctermfg=191 gui=bold cterm=bold
hi ansEnvVar guifg=#dfff5f ctermfg=191 gui=none cterm=none
hi ansDirective guifg=#df00ff ctermfg=165 gui=bold cterm=bold

hi ansComment guifg=#5f5f5f ctermfg=59
hi ansCommentHeader guifg=#5f5f5f ctermfg=59
hi ansCommentHeader guifg=#ff8700 ctermfg=208 gui=bold cterm=bold
hi ansCommentDisabled guifg=#303030 ctermfg=236
hi ansCommentDebug guifg=#ff0000 ctermfg=196 gui=italic cterm=italic

hi ansNumber guifg=#87ff87 ctermfg=120

hi ExtraWhitespace guibg=#df0000 ctermbg=160
" }}}

""" Folding {{{
" :help fold-text
" http://stackoverflow.com/questions/5983396/change-the-text-in-folds
" see: 'fillchars', 'foldtext'
set foldtext=FoldTaskBlock()
fun! FoldTaskBlock()
let line = getline(v:foldstart)
"let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
let sub = substitute(line, '- name: ', '▶ ', 'g')
"return v:folddashes . sub
return sub . ' '
endfun

set fillchars=fold:·

"set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
" }}}

"colo comments
