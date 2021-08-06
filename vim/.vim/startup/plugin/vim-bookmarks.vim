" We want different bookmarks per dir/project
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" We want our own mappings
let g:bookmark_no_default_key_mappings = 1

let g:bookmark_sign = '☰ '

" Store bookmarks per-git branch, or ./.bookmarks for non-git folders
function! g:BMWorkDirFileLocation()
    let filename = 'bookmarks'
    let location = ''
    if isdirectory('.git')
        " Current work dir is git's work tree
        let location = getcwd().'/.git'
    else
        " Look upwards (at parents) for a directory named '.git'
        let location = finddir('.git', '.;')
    endif
    if len(location) > 0
        return location.'/bookmarks-'.FugitiveHead()
    else
        return getcwd().'/.bookmarks'
    endif
endfunction
