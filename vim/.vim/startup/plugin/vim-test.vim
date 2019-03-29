let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pipenv run pytest'

let test#ruby#use_binstubs = 0
let test#ruby#rspec#options = '--fail-fast --order 0'

" uncomment to use custom formater that populate quickfix with spec errors
" let test#ruby#rspec#options = '--fail-fast --format progress --require ~/src/dotfiles/rspec/formatters/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out --order 0'
