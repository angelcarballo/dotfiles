setlocal expandtab
setlocal shiftwidth=2

" Note that the closing fi will be added automatically by endwise plugin
iabbrev if if [ -f some_file ]; then<cr>
iabbrev ifelse if [ -f some_file ]; then<cr>echo 'Foo'<cr>else<cr>
iabbrev case case $foo in<cr>value)<cr>echo 'Foo';;
