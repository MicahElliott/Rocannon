" Vim filetype plugin file
" Language:         Ansible
" Maintainer:       Micah Elliott

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Enable completions
setlocal omnifunc=rocannon#CompleteAnsible

" Gets typed so often
iab n: - name:
iab r: register:
iab w: with_items:
iab e: environment:
iab t: tags: [
iab #v # vim:set ft=ansible:<C-r>=rocannon#Eatchar('\s')<CR>


" Color Scheme
if !exists('g:rocannon_bypass_colorscheme')
  let g:rocannon_bypass_colorscheme = 0
endif
if g:rocannon_bypass_colorscheme != 1
  " Set up highlights specific to ansible
  colorscheme rocannon
endif

" Bouncing around (navigation)
command RV split %:p:h/../vars/main.yml
command RT split %:p:h/../templates/main.yml
command RH split %:p:h/../handlers/main.yml
command RK split %:p:h/../tasks/main.yml
command RF split %:p:h/../files/main.yml

" For new tabs
command RVT tabnew %:p:h/../vars/main.yml
command RTT tabnew %:p:h/../templates/main.yml
command RHT tabnew %:p:h/../handlers/main.yml
command RKT tabnew %:p:h/../tasks/main.yml
command RFT tabnew %:p:h/../files/main.yml

" For in-buffer
command RVB edit %:p:h/../vars/main.yml
command RTB edit %:p:h/../templates/main.yml
command RHB edit %:p:h/../handlers/main.yml
command RKB edit %:p:h/../tasks/main.yml
command RFB edit %:p:h/../files/main.yml

ec 'checking for rocannon_bounce_mappings'
if exists('g:rocannon_bounce_mappings') && g:rocannon_bounce_mappings == 1
  ec 'mapping for rocannon_bounce_mappings'
  nnoremap <Leader>v :RV<CR>
endif

" Built-in help
set keywordprg=:help

set foldmethod=syntax
