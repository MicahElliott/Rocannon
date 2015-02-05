# Rocannon: Operator of the Ansible
  _Vim omni-completion, abbreviations, syntax, and colorscheme for Ansible playbooks_

Command the Ansible, Relish the Rainbow. Never visit the Ansible docs again.

[!img rainbow.jpg]
![Rocannon!](https://p.gr-assets.com/540x540/fit/hostedimages/1421611454/13392548.jpg)

Philosophy: Ansible is a unique DSL with semantics way beyond Vim’s simple
built-in YAML treatment. Thus, Ansible files need a totally different type of
highlighting — and of course completion of actions and their args.

_DISCLAIMER_: This is not a robust Vim implementation but mostly works if you
stick to Ansible best practices (like starting each task with a `name`).

Animated GIF:

## Installation
However you want. Here I’m using Vundle:
    % echo 'Bundle "MicahElliott/Rocannon"' >>~/.vimrc
    % vim +BundleInstall +qall

You could even use Ansible!
    % ansible localhost -m git -a 'repo=https://github.com/MicahElliott/Rocannon dest=~/.vim/bundle/Rocannon'

Add to the top of each Ansible YAML file:
    --- vim:set ft=ansible
Or name them like `foo.ans` instead of `foo.yml`.
_(It would be really nice if Ansible supported a `*.ans` file extension.)_

Rocannon bypasses the traditional `yaml.vim` plugin, which I find to be
overkill/meddlesome for Ansible files.

## Completions
All known Ansible **actions** are omni-completed, and a short description is
shown. Actions also have abbreviations, so that when you type `yum: ` it will
complete to `yum: name=`. There are also completions for each arg, so if you
type `yum: <C-x><C-o>` (tip: use `<C-Space>` as your omni-completer) you will
see a list of all possible args.

## Syntax/Highlighting (colorscheme)
Yes, it’s very colorful. Although initially jarring, I find this quite
helpful. The scheme is called _rocannon_. I recommend that you embrace this
rainbow, but if you must reject it, put this in your `$VIMRUNIME`:
    let g:rocannon_bypass_colorscheme = 1

## More Info
Use the vim help:
    :help rocannon

## Folding
Plays can be folded into a single line containing just the `name:`
description.

## Select-n-run
Vim-Fireplace has a fantastic feature that lets you execute any block of text.

## Jumping between files (like vim-rails)
Several files in a role often need to be bounced around in. Vim-Rails supports
this nicely bouncing between controllers, views, and models. Rocannon should
do the same between tasks, handlers, templates, files, and vars.

## To its fullest
It’s helpful to have a font and terminal that fully support 256 colors, bold,
underline, italic, etc. If you don't already have that covered, I recommend
[Orp-Font]() (if you like it small and bitmapped) and [Urxvt]().

## License
Copyright © Micah Elliott. Distributed under the same terms as Vim itself. See
`:help license`.
