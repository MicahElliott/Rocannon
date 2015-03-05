# Rocannon: Operator of the Ansible

Command the Ansible, Relish the Rainbow. Never visit the Ansible docs again.

![Rocannon!](https://raw.githubusercontent.com/MicahElliott/Rocannon/master/img/rainbow.jpg)

Ansible is a unique DSL with semantics way beyond an editor’s simple
built-in YAML treatment. Thus, Ansible files need a totally different type of
syntax highlighting — and of course completion of actions and their args.

## Features
* Completion system that’s aware of all ansible modules/actions and their
  args, and even the unique `state=` values
* Syntax for semantics of Ansible, way beyond vanilla YAML
* A 256-color scheme to make use of the extended syntax
* Local, comprehensive documentation system that mirrors online docs (use `K`)
* Folding regions to collapse task blocks into simple, readable lists
* Simple skeleton for new `.ans`/`.yaml` files
* “Bouncing” between related roles files
* Execution of individual plays (via implicit tags and `:make`)

(This is a somewhat simplistic Vim implementation, but mostly works if you
stick to Ansible best practices
[http://docs.ansible.com/playbooks_best_practices.html]().)

## Demo
- Vanilla YAML file with default highlighting
- Change the filetype to ansible (can be done in other ways)
- Reopen file to reflect filetype
- Notice the folding
- Create a new "stat" play to not install pbzip2 otherwise
- Notice the completion of action and arg (other args also completable)
- Pull up documentation for `stat` with `K`

![Rocannon Demo!](https://raw.githubusercontent.com/MicahElliott/Rocannon/master/examples/demo4.gif)

## Installation
However you want. Here I’m using Vundle:

    % vim ~/.vimrc " add line: Bundle "MicahElliott/Rocannon"
    % vim +BundleInstall +qa

You could even use Ansible!

    % ansible localhost -m git -a 'repo=https://github.com/MicahElliott/Rocannon dest=~/.vim/bundle/Rocannon'

Add to the top (or bottom) of each Ansible YAML file:

    ---
    # vim:ft=ansible:

Or name them like `foo.ans` or `foo.yaml` instead of `foo.yml`.
_(It would be really nice if Ansible supported a `*.ans` file extension.)_

## Comprehensive Help
This README is just to get you started. Use the extensive [vim
help](https://github.com/MicahElliott/Rocannon/blob/master/doc/rocannon.txt)
to learn the important details:

    :help rocannon

Every Ansible module’s online documentation is also available via vim’s `K`.

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
Several files in a role often need to be bounced around between. Vim-Rails
supports this nicely, bouncing between controllers, views, models, tests, etc.
Rocannon should do the same between tasks, handlers, templates, files, and
vars.

## To its fullest
It’s helpful to have a terminal and font that fully support 256 colors, bold,
underline, italic, etc. If you don't already have that covered, I recommend
[Urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) and
[Orp-Font](https://github.com/MicahElliott/Orp-Font) (if you like bitmapped).

## License
Copyright © Micah Elliott. Distributed under the same terms as Vim itself. See
`:help license`.
