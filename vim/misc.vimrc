" ---------------
" File type stuff
" ---------------

" Some files should never have spaces at the end of lines
autocmd FileType c,coffee,scss,css,styl,jade,md,markdown,rb,cpp,java,php,py,python,html,mako,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set tab width based on language
autocmd FileType html,mako,javascript,typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php,py,python,java setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Explicitly set filetype for some less common files
au BufRead,BufNewFile *.md,*.markdown set filetype=ghmarkdown
au BufRead,BufNewFile *.mako set filetype=mako
au BufRead,BufNewFile *.eslintrc,*.jshintrc,*.babelrc set filetype=json
au BufRead,BufNewFile Jenkinsfile set filetype=groovy

" Turn on neomake when saving or opening a buffer
autocmd! BufWritePost,BufEnter * Neomake

" -----------
" Misc tweaks
" -----------

" fix too long of a delay after hitting ESC to get back into normal mode
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" :Tab command to set tab width
:command -nargs=1 Tab set tabstop=<args> shiftwidth=<args> softtabstop=<args>

" turn off deoplete for some file types
autocmd FileType tex,notes,markdown,md,pandoc,ghmarkdown,text,buffer
       \ call deoplete#custom#buffer_option('auto_complete', v:false)


" --------------------------------
" Goyo (vim writing env) functions
" --------------------------------

nnoremap <leader>G :Goyo<CR>
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set linebreak
  set invlist
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set invlist
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
