# Contributing

The completion and syntax are generated from `ansible-doc` output.

If you maintain a module outside of Ansible core, you may want to add it to
Rocannon. There are scripts here that will enable this.

And when Ansible adds/changes modules, we'll want the completion/syntax to
reflect it. Everything can be regenerated through simple steps listed herein...

## Generate the ansible-doc text logs

    cd bin
    ./ans2txt.zsh

## About the logs
The output for a given module is done with `ansible-doc -s yum`. Its output
will look like:

- name: M a n a g e s   p a c k a g e s   w i t h   t h e   I
  action: yum
      conf_file              # The remote yum configuration f
      disable_gpg_check      # Whether to disable the GPG che
      disablerepo            # `Repoid' of repositories to di
      enablerepo             # `Repoid' of repositories to en
      list                   # Various (non-idempotent) comma
      name=                  # Package name, or package speci
      state                  # Whether to install (`present',

You can see that the only required arg is `name` (it has an `=`). The scripts
herein reduce this down to a single abbreviation for the required args:

    iab yum: yum: name=

And a dictionary of optional args for omni-completion, like:

    {...
     'yum': [
       {'item': 'conf_file':         'menu': 'The remote yum...'},
       {'item': 'disable_gpg_check': 'menu': 'Whether to disabl...'},

All the processing scripts are actually just vim commands, applied with the
"scriptin" vim trick (`-s`):

    vim --noplugin -u /dev/null -s ans2vimabbr.vim foo.txt

I normally would have turned to `sed` for this, but Vim was great!

## More Thoughts

Should try to get ansible to accepts files with .ans suffix, since its yaml is
significantly extended from regular yaml. Would make identify filetype
easier..

Try experimenting with clean new filetype by playing with a test.ans file.

Would be amazing to simply highlight a task and press something to run ansible
on it. Could be done by silently/temporarily adding some unique tag.

## Ansible vars
    ansible localhost -m setup |awk '/ansible_/ {print $1}' >ansvars.json
