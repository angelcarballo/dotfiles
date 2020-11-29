" Custom strategy to avoid echoing command
function! CustomVimuxStrategy(cmd)
  call VimuxRunCommand(a:cmd)
endfunction
let g:test#custom_strategies = {'customvimux': function('CustomVimuxStrategy')}
let g:test#strategy = 'customvimux'

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pipenv run pytest'

let test#ruby#use_binstubs = 1
let test#ruby#rspec#options = {
  \ 'nearest': '--fail-fast --order 0 --format documentation',
  \ 'file': '--fail-fast --order 0 --format documentation',
  \ 'suite': '--fail-fast',
\}

let test#elixir#exunit#options = {
  \'suite': '--stale',
\}

" uncomment to use custom formater that populate quickfix with spec errors
" let test#ruby#rspec#options = '--fail-fast --format progress --require ~/src/dotfiles/rspec/formatters/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out --order 0'
