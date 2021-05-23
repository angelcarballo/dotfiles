setlocal expandtab
setlocal shiftwidth=2

" Note that the closing fi will be added automatically by endwise plugin
inoreabbrev <buffer> if if [ -f some_file ]; then<cr>
inoreabbrev <buffer> ifelse if [ -f some_file ]; then<cr>echo 'Foo'<cr>else<cr>
inoreabbrev <buffer> case case $foo in<cr>value)<cr>echo 'Foo';;
