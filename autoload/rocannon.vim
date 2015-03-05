" Main Rocannon autoload file

"echo 'Loading ansiblecomplete and sleeping'
"sleep 1

" Can generate all actions and their params with:
"
" ansible-doc -l |awk '{print $1}' |while read cmd; do print $cmd; ansible-doc -s $cmd; done >all.log

" See csscomplete.vim for omnicomplete reference

"echom 'getting autoloaded'

" Should this use source or runtime?
runtime autoload/reqargs.vim
runtime autoload/optargs.vim
runtime autoload/actions.vim
runtime autoload/states.vim

" Called by reqargs completions
fun! rocannon#Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

fun! rocannon#CompleteAnsible(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start

  else
    let res = []
    let line = getline('.')

    " Optional args: see if we're into an action line
    if line =~ '^\s\+\w\+:'
      let act = substitute(line, '^\s\+\(\w\+\): .*', '\1', '')

      if line =~ '^\s\+\w\+: .*state=$'
        return g:states[act]
      endif

      return g:optargs[act]
    endif

    " Complete ansible_* vars. See all with:
    " ansible localhost -m setup

    " Could complete register vars, foo_r.<C-]>
    " But there are typically only a few, like stat and changed

    " Actions: beginning of line
    for act in g:actions
      if act['word'] =~ '^' . a:base
        call add(res, act)
      endif
    endfor
    return res

  endif
endfun
"set completefunc=CompleteAnsible
"set omnifunc=CompleteAnsible


" Bounce between different role files.
" If editing
"   roles/dbsvrs/tasks/main.yml
" should be able to bounce over to
"   roles/dbsvrs/vars/main.yml
" with :RVars

fun! rocannon#OpenAlternate(action, category)
  " Action should be one of: split, edit, tabnew
  " TODO:  - should have some smarts about whether matching files names exists,
  "          and fall back to main.yaml
  "        - open dir (browser) for files and templates
  " NOTE: connecting vars with / to avoid "not a file" message
  let fname = expand('%:p:t')
  let role = expand('%:p:h:h:t') . '/'
  "echom 'will look for: roles/' . role . a:category . '/' . fname
  if filereadable('roles/' . role . a:category . '/' . fname)
    let tgt = '/' . fname
  elseif a:category == 'files' || a:category == 'templates'
    " Just open the dir (with vim a file browser like nerdtree or default)
    let tgt = ''
  else
    let tgt = '/main.yaml'
  endif
  exe a:action . ' roles/' . role . a:category . tgt
endfun
