#! /usr/bin/env zsh

# sitedocs2txt — scrape ansible site docs into many parsable text files
# Crappiest code ever.

dump() { elinks -no-numbering -no-references -dump-width 200 -dump $1 }

allmods=../tmp/all-modules.lst

if [[ -f list_of_all_modules.html ]]; then
  print 'Already have list of modules'
else
  print 'Dumping list of all modules'
  # Really sill way to do this, but pretty safe to assume that nothing will
  # be outside of a10 and zypper.
  dump http://docs.ansible.com/list_of_all_modules.html |
    sed -nr '/• a10_server/,/• zypper_repository/ p' |
    sed -r 's/.*• //; s/\s.*//' >$allmods
fi

vimhelp() {
  mkdir -p ../doc/mod.txt
  while read mod; do
    modtxt=../doc/mod.txt/$mod.txt
    modtmphtml=../tmp/$mod.html
    modtmp=../tmp/$mod.txt.tmp
    url=http://docs.ansible.com/${mod}_module.html
    print "Dumping and creating docs for $mod"
    if [[ ! -f $modtmphtml ]]; then
      print "Downloading html (and sleeping) for $mod"
      wget $url -O $modtmphtml
      sleep 5
    fi
    dump $modtmphtml >|$modtmp
    # Synopsis
    print "SYNOPSIS                           *$mod*\n" >|$modtxt
    sed -nr '/^Synopsis¶/,/^Options¶/ p' $modtmp |
      sed -n '3,$p' |sed '$d' |
      sed -r 's/^\s+//' >>$modtxt
    # Examples
    print "EXAMPLES                           *$mod-examples*\n>" >>$modtxt
    sed -nr '/^Examples¶/,/^This is a.* Module¶/ p' $modtmp |
      sed -n '3,$p' |sed '$d' |
      sed -r 's/^/   /' >>$modtxt
    print "MORE INFO                          *$mod-moreinfo*\n>" >>$modtxt
    print "All arguments are omni-completed, but if you really want to see the online docs:" >>$modtxt
    print $url >>$modtxt
    #rm $modtmp $modtmphtml
  done <$allmods
}

# state completions
statecompl() {
  statesvim=../autoload/states.vim
  print 'let states = {' >|$statesvim
  while read mod; do
    modtmphtml=../tmp/$mod.html
    # blech
    states=$(awk '/<td>state<\/td>/ {x=NR+3} NR==x {gsub(/<\/?(td|ul|li)>/, " "); sub(/^\s+/, "\""); sub(/\s+$/, "\""); gsub(/\s+/, "\",\""); print}' $modtmphtml)
    grep -qP '\w' <<<$states &&
      print " \\\ '$mod': [ $states ]," >>$statesvim
  done <$allmods
  print " \\\ }" >>$statesvim
}

vimhelp
statecompl

print 'Generating all vim docs'
vim -c ':helptags ../doc |q'

print 'You may want to clean up ../tmp now.'
