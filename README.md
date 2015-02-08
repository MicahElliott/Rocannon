# Rocannon: Operator of the Ansible
  _Vim omni-completion, abbreviations, syntax, and colorscheme for Ansible playbooks_

Command the Ansible, Relish the Rainbow. Never visit the Ansible docs again.

![Rocannon!](https://raw.githubusercontent.com/MicahElliott/Rocannon/master/img/rainbow.jpg)

Philosophy: Ansible is a unique DSL with semantics way beyond Vim’s simple
built-in YAML treatment. Thus, Ansible files need a totally different type of
highlighting — and of course completion of actions and their args.

_DISCLAIMER_: This is a somewhat simplistic Vim implementation, but mostly
works if you stick to Ansible best practices
[http://docs.ansible.com/playbooks_best_practices.html]().

Animated GIF:

## Installation
However you want. Here I’m using Vundle:

    % vim ~/.vimrc " add line: Bundle "MicahElliott/Rocannon"
    % vim +BundleInstall +qa

You could even use Ansible!

    % ansible localhost -m git -a 'repo=https://github.com/MicahElliott/Rocannon dest=~/.vim/bundle/Rocannon'

Add to the top of each Ansible YAML file:

    --- vim:set ft=ansible

Or name them like `foo.ans` instead of `foo.yml`.
_(It would be really nice if Ansible supported a `*.ans` file extension.)_

Rocannon bypasses the traditional `yaml.vim` plugin, which I find to be
overkill/meddlesome for Ansible files.

## Comprehensive Help
This README is just to get you started. Use the extensive vim help to learn
the important details:

    :help rocannon

## To its fullest
It’s helpful to have a terminal and font that fully support 256 colors, bold,
underline, italic, etc. If you don't already have that covered, I recommend
[Urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) and
[Orp-Font](https://github.com/MicahElliott/Orp-Font) (if you like bitmapped).

## Completions
All known Ansible **actions** are omni-completed, and a short description is
shown. Actions also have abbreviations, so that when you type `yum: ` it will
complete to `yum: name=`. There are also completions for each arg, so if you
type `yum: name=zsh <C-x><C-o>` you will see a list of all possible args. Even
`state` values are completed.

## Syntax/Highlighting (colorscheme)
Yes, it’s very colorful. Although initially jarring, I find this quite
helpful. The scheme is called _rocannon_. I recommend that you embrace this
rainbow (though it can be turned off).

## Folding
Plays can be folded into a single line containing just the `name:`
description.

## Jumping between files (like vim-rails)
Several files in a role often need to be bounced around in. Vim-Rails supports
this nicely bouncing between controllers, views, and models. Rocannon should
do the same between tasks, handlers, templates, files, and vars.

## License
Copyright © Micah Elliott. Distributed under the same terms as Vim itself. See
`:help license`.
