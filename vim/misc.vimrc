" ---------------
" File type stuff
" ---------------

let s:dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Some files should never have spaces at the end of lines
autocmd FileType c,coffee,scss,css,styl,jade,md,markdown,rb,cpp,java,php,py,python,html,mako,javascript,typescript,typescript.tsx,lua autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set tab width based on language
autocmd FileType html,mako,javascript,typescripta,typescript.tsx,scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php,py,python,java setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Explicitly set filetype for some less common files
au BufRead,BufNewFile *.md,*.markdown set filetype=markdown.pandoc
au BufRead,BufNewFile *.mako set filetype=mako
au BufRead,BufNewFile *.eslintrc,*.jshintrc,*.babelrc set filetype=json
au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
au BufRead,BufNewFile Jenkinsfile set filetype=groovy
au BufRead,BufNewFile *.mjs set filetype=javascript
au BufRead,BufNewFile *.arc set filetype=arc

" Turn on neomake when saving or opening a buffer
if !exists('g:vscode')
    autocmd! BufWritePost,BufEnter * Neomake
end

" -----------
" Misc tweaks
" -----------

" allow easy 'deleting' of a current buffer
nmap ,x :b#<bar>bd#<CR>

" fix too long of a delay after hitting ESC to get back into normal mode
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" :Tab command to set tab width
:command -nargs=1 Tab set tabstop=<args> shiftwidth=<args> softtabstop=<args>

" set up markdown list indentation via comments hack, and don't use CoC in markdown
au filetype markdown.pandoc set formatoptions+=ro
au filetype markdown.pandoc set comments=b:*,b:-,b:+,b:1.,n:>
"au filetype markdown.pandoc CocDisable


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
