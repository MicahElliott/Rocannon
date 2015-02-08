"echo 'Loaded syntax: ansible.vim'

runtime syntax/actions.vim

"sy match ansNameKey "- name: .*"
syn match ansNameLine "- name: .*" contains=ansNameText
hi def link ansNameLine Label
syn match   ansNameText ": .*" contained
hi def link ansNameText Label

"sy match ansTmpl "{{.*}}"
syn match   ansTmpl "{{"
syn match   ansTmpl "}}"
hi def link ansTmpl SpecialChar

syn match   ansParam "\s\w\+="
hi def link ansParam Keyword

syn match   ansWhen "when:" "changed_when:"
hi def link ansWhen Conditional

syn match   ansNotify "notify:"
hi def link ansNotify Function
syn match   ansNotifyStep /^\s\+-\s\w\+\s\w\+.*/
hi def link ansNotifyStep Function

syn match   ansTags "tags:"
hi def link ansTags Tags

"sy match ansWith "with_\(items\|fileglobs\|nested\|together\|sequence\):"
syn match   ansWith "with_\w\+:"
syn match   ansWith "until:"
hi def link ansWith Repeat
syn keyword ansItem item
hi def link ansItem Repeat

syn match   ansReg "register:"
hi def link ansReg Define
syn match   ansRegVar "\w\+_r\>"
hi def link ansReg Define

syn match   ansComment "#.*"
hi def link ansComment Comment

syn match   ansIgnore "ignore_errors:"
hi def link ansIgnore Exception

syn keyword ansSpecials tasks pre_tasks post_tasks handlers roles
hi def link ansSpecials Macro

syn keyword ansParallel poll async
"hi def link ansParallel StorageClass

syn keyword ansTargets user sudo sudo_user connection gather_facts hosts vars vars_files vars_prompt
hi def link ansTargets Typedef

syn match   ansKeyword "ansible_\w\+"
hi def link ansKeyword Identifier
syn keyword ansSpecialVars inventory_host
hi def link ansSpecialVars Identifier
syn match   ansEnvVar "[A-Z][A-Z_]\+"
hi def link ansSpecialVars Identifier

"sy keyword ansBoolean True true yes on False false no off
syn keyword ansBoolean         true True TRUE false False FALSE yes Yes YES no No NO on On ON off Off OFF
syn match   ansBoolean         ":.*\zs\W[+-]\(\W\|$\)" contained
hi def link ansBoolean Boolean

" Need to generate these from ansible-doc
"syn match   ansAction "^\s\+(file\|copy\|yum\|template\|stat\|service\|ping\|pause\|monit\|hostname\|user\|get_url\|debug\|cron\|command\|git\|assert\|assemble\|apt):"
hi def link ansAction Operator

"sy match ansNumber "\<\d\>"

hi link helpStar ansAction


" Folding based on `name` line
syn region ansFold start="#\?- name:" end="\n\n" transparent fold
"syn region ansFoldCommented start="#\s*?- name:" end="\n\n" transparent fold

syn region  ansDirective  display oneline start='^---' end='$'
