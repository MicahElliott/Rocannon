echo 'Loading ansiblecomplete'
"sleep 2

" Can generate all actions and their params with:
"
" ansible-doc -l |awk '{print $1}' |while read cmd; do print $cmd; ansible-doc -s $cmd; done >all.log

" See csscomplete.vim for omnicomplete reference

"runtime /home/mde/exp/vim/vars.vim
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







" All ansible vars (from `-m setup`)
" ansible_facts
" ansible_all_ipv4_addresses
" ansible_all_ipv6_addresses
" ansible_architecture
" ansible_bios_date
" ansible_bios_version
" ansible_cmdline
" ansible_date_time
" ansible_default_ipv4
" ansible_default_ipv6
" ansible_devices
" ansible_distribution
" ansible_distribution_major_version
" ansible_distribution_release
" ansible_distribution_version
" ansible_domain
" ansible_env
" ansible_eth0
" ansible_fips
" ansible_form_factor
" ansible_fqdn
" ansible_hostname
" ansible_interfaces
" ansible_kernel
" ansible_lo
" ansible_machine
" ansible_memfree_mb
" ansible_memtotal_mb
" ansible_mounts
" ansible_nodename
" ansible_os_family
" ansible_pkg_mgr
" ansible_processor
" ansible_processor_cores
" ansible_processor_count
" ansible_processor_threads_per_core
" ansible_processor_vcpus
" ansible_product_name
" ansible_product_serial
" ansible_product_uuid
" ansible_product_version
" ansible_python_version
" ansible_selinux
" ansible_ssh_host_key_ecdsa_public
" ansible_ssh_host_key_rsa_public
" ansible_swapfree_mb
" ansible_swaptotal_mb
" ansible_system
" ansible_system_vendor
" ansible_user_id
" ansible_userspace_architecture
" ansible_userspace_bits
" ansible_virtualization_role
" ansible_virtualization_type


  "let mos = [
      "\ {'word': 'file', 'menu': 'my birthday', 'info': 'even more jan info'},
      "\ {'word': 'copy', 'menu': 'for lovers', 'info': 'even more feb info'},
      "\ {'word': 'Mar', 'menu': 'like a lion', 'info': 'even more mar info'},
      "\ {'word': 'Jun', 'menu': 'for a&d', 'info': 'even more jun info'},
      "\ {'word': 'Jul', 'menu': 'anniversary month', 'info': 'even more jul info'} ]

"let s:values = split('file copy yum template stat service ping pause monit hostname user get_url debug cron command git assert assemble apt')

"fun! rocannon#CompleteAnsible(findstart, base)

  "let colon = strridx(line, ':')
  "if colon > -1
    "let borders[colon] = "colon"
  "endif

  "if a:findstart
    "" We need whole line to do proper checking
    "let line = getline('.')
    "let start = col('.') - 1
    "let compl_begin = col('.') - 2
    "while start >= 0 && line[start - 1] =~ '\%(\k\|-\)'
      "let start -= 1
    "endwhile
    "let b:compl_context = line[0:compl_begin]
    "return start
  "endif

  "if exists("b:compl_context")
    "let line = b:compl_context
    "unlet! b:compl_context
  "else
    "let line = a:base
  "endif

  "let res = []
  "let res2 = []


  "if borders[max(keys(borders))] == 'colon'
    "echo 'matched a colon'
    "let action = matchstr(line, '\zs[a-zA-Z-]*\ze\s*:[^:]\{-}$')

    "if action == 'file'
      "let values = [ 'follow', 'force', 'group', 'mode', 'owner', 'path', 'recurse', 'selevel', 'serole', 'setype', 'seuser', 'src', 'state']
    ",

    "elseif action == 'copy'
      "let values = ['backup', 'content', 'dest', 'directory_mode', 'follow', 'force', 'group', 'mode', 'owner', 'selevel', 'serole', 'setype', 'seuser', 'src', 'validate']

    "" Complete values
    "let entered_value = matchstr(line, '.\{-}\zs[a-zA-Z0-9#,.(_-]*$')

    ""for m in values
        ""if m =~? '^'.entered_value
            ""call add(res, m)
        ""elseif m =~? entered_value
            ""call add(res2, m)
        ""endif
    ""endfor
    ""return res + res2

    "return entered_value
  "endif

"endfun

