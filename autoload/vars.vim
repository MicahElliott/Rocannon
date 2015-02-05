
let actions = [
      \ {'word': 'gram', 'menu': 'my birthday info', 'info': 'even more jan', 'args': [{'a':'b'}]},
      \ {'word': 'gem', 'menu': 'for lovers', 'info': 'even more feb info'},
      \ {'word': 'Mar', 'menu': 'like a lion', 'info': 'even more mar info'},
      \ {'word': 'Jun', 'menu': 'for a&d', 'info': 'even more jun info'},
      \ {'word': 'Jul', 'menu': 'anniversary month', 'info': 'even more jul info'} ]

let args = {
  \    'gram': [
  \      { 'word': 'dest=',                  'menu': 'A directory to save the file into. For example, '' direct...' },
  \      { 'word': 'fail_on_missing',        'menu': 'Makes it fails when the source file is missing.' },
  \      { 'word': 'flat',                   'menu': 'Allows you to override the default behavior' },
  \      { 'word': 'src=',                   'menu': 'The file on the remote system to fetch. This `must'' ' }, 
  \      { 'word': 'validate_checksum',      'menu': 'Verify that the source and destination checksums ' },
  \    ],
  \    'gem': [
  \      { 'word': 'executable',             'menu': 'Override the path to the gem executable' },
  \      { 'word': 'gem_source',             'menu': 'The path to a local gem used as installation source.' },
  \      { 'word': 'include_dependencies',   'menu': 'Whether to include dependencies or not.' },
  \      { 'word': 'name=',                  'menu': 'The name of the gem to be managed.' },
  \      { 'word': 'pre_release',            'menu': 'Allow installation of pre-release versions of the gem.' },
  \      { 'word': 'repository',             'menu': 'The repository from which the gem will be installed' },
  \      { 'word': 'state',                  'menu': 'The desired state of the gem. `latest'' ensures ' }, 
  \      { 'word': 'user_install',           'menu': 'Install gem in user''s local gems cache or for all users' },
  \      { 'word': 'version',                'menu': 'Version of the gem to be installed/removed.' },
  \    ]
  \ }
