" -----------------
" Colors and themes
" -----------------

set termguicolors
let base16colorspace=256
set background=dark

colorscheme base16-tomorrow-night

" Let nvim change cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" Hack to get C-h working in neovim
" nmap <BS> <C-W>h
