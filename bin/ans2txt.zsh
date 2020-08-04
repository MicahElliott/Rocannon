#! /usr/bin/env zsh

# ans2vim — pull actions, abbrs, args from ansible and convert to vim dicts

### Generate doc dumps
print 'Generating text dump of actions...'
ansible-doc -l |sed '/^$/,$ d' >|actions.txt

brokens=(ec2_metric_alarm ec2_scaling_policy rax_dns stackdriver)
print 'Generating text dump of all args...'
# Could ignore broken modules, but not worth it for now
#while read -r cmd txt; do ansible-doc -s $cmd 2>/dev/null; done <actions.txt >|args.txt
for i in $(cat actions.txt | cut -d" " -f1); do ansible-doc -s $i; done >|args.txt

# Remove traceback lines for failures in ansible-doc
sed -i '/traceback/d' args.txt

### Actions
print 'Wrote actions to ../autoload/actions.vim'
vim --noplugin -u /dev/null -s txt2actions.vim actions.txt

### Abbreviations
print 'Wrote required args to ../autoload/reqargs.vim'
vim --noplugin -u /dev/null -s txt2reqargs.vim args.txt

### Args
print 'Wrote optional args to ../autoload/optargs.vim'
vim --noplugin -u /dev/null -s txt2optargs.vim args.txt

### Action Syntax
print 'Wrote ansAction syntax to ../syntax/actions.vim'
vim --noplugin -u /dev/null -s txt2syn.vim actions.txt
