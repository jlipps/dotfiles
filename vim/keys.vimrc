" ----------------
" Basic remappings
" ----------------

let mapleader = ","
let maplocalleader = "["

" case insensitive search
nnoremap / /\v
vnoremap / /\v

" deselect
nnoremap <leader><space> :noh<cr>

" tab to move cursor to matching bracket
nnoremap <tab> %
vnoremap <tab> %

" motion remappings
nnoremap <up> <nop>   " arrow keys are weak!
nnoremap <down> <nop>
nnoremap <left> <<    " l/r arrows used for in/dedentions
nnoremap <right> >>
vnoremap <left> <gv
vnoremap <right> >gv
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" no need to use shift for :
nnoremap ; :

" press j and k at same time for esc
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

" toggle tag list and file explorer
nnoremap <leader>lt :TlistToggle<CR>
nnoremap <leader>N :NERDTreeToggle<CR>

" ctrl-p options
nnoremap <leader>t :CtrlPMRU<CR>  " look through MRU file list
nnoremap <leader>T :CtrlP<CR>  " look through all files in projecdt
nnoremap <leader>R :CtrlPClearCache<CR>  " clear file cache
nnoremap <leader>g :CtrlPTag<CR>  " look through tags

" easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" ------------------
" Splits and buffers
" ------------------

function! s:incrementSplitWidth(inc)
    let l:newwidth = winwidth(0) + a:inc 
    :execute 'vertical resize ' . l:newwidth
endfunction

command! IncrementSplitWidth call s:incrementSplitWidth(1)
command! DecrementSplitWidth call s:incrementSplitWidth(-1)
command! SetFinderWidth execute 'vertical resize 30'

" new vertical or horizontal splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

nnoremap <leader>b :tabnew<CR> " open new tab
nnoremap <leader>x :BD<CR>     " kill buffer but not window
nnoremap <leader>X :Bda<CR>    " kill all buffers

nnoremap <C-m> :100winc+<CR>  " maximize split vertically
nnoremap <M-\> :IncrementSplitWidth<CR>  " make split wider
nnoremap <M-/> :DecrementSplitWidth<CR>  " make split narrower
nmap <Char-61> :winc=<CR>  " make split heights and widths equal

" ctrl + motion commands moves around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

:command -nargs=1 VR vertical resize <args> " :VR 50 = make 50 lines high

