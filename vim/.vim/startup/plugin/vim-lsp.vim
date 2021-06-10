autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'elixir-ls',
      \ 'cmd': {server_info->['/Users/angel/src/elixir-ls/release/language_server.sh']},
      \ 'workspace_config': {'elixirLS': {'dialyzerEnabled': v:false}},
      \ 'allowlist': ['elixir']
      \ })

autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'efm-langserver',
      \ 'cmd': {server_info->['efm-langserver', '-c=/Users/angel/.config/efm-langserver/config.yaml']},
      \ 'allowlist': ['elixir']
      \ })

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    setlocal tagfunc=lsp#tagfunc

    nmap <buffer> ss <plug>(lsp-document-symbol-search)
    nmap <buffer> gR <plug>(lsp-references)
    nmap <buffer> [e <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]e <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> gK :Dash!<cr>

    autocmd! BufWritePre *.ex,*.exs call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" Show error descriptions in command line
let g:lsp_diagnostics_echo_cursor = 1

" Opens preview windows as normal windows
let g:lsp_preview_float = 0

" Closes the preview window on the second call to preview
let g:lsp_preview_doubletap = [function('lsp#ui#vim#output#closepreview')]

let g:lsp_tagfunc_source_methods = ['definition']
let g:lsp_format_sync_timeout = 1000

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/.vim-lsp.log')
