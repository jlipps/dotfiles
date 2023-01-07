" -------
" Plugins
" -------

call plug#begin(stdpath('data') . '/plugged')


" General Vim utilities
Plug 'sjl/gundo.vim', {'on': 'GUndoToggle'}  " undo tree visualizer
Plug 'kana/vim-arpeggio'  " press multiple keys to make a chord
Plug 'tpope/vim-surround'  " change surrounding characters
Plug 'Shougo/vimproc.vim', {'do': 'make'}  " async cmd execution
if !exists('g:vscode')
    Plug 'christoomey/vim-tmux-navigator'  " play nice with tmux splits
    Plug 'mattn/calendar-vim', {'on': 'Calendar'}  " little calendar
    Plug 'sjl/vitality.vim'  " play nice with iterm2 and tmux
end

" IDE
if !exists('g:vscode')
    Plug 'gpanders/editorconfig.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "Plug 'nvim-treesitter/playground'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}  " file explorer
    Plug 'kien/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMRU']}  " fuzzy file finder
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' " status bar
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-java coc-omnisharp coc-tsserver coc-python coc-eslint coc-deno coc-svelte coc-css coc-prettier'}  " code completion based on lang server
    Plug 'neomake/neomake', {'on': 'Neomake'}  " maker and linter
    Plug 'benjie/neomake-local-eslint.vim'  " auto lint with .eslintrc
    Plug 'drewschrauf/neomake-local-tslint.vim'  " auto lint with .tslintrc
    Plug 'fatih/vim-go', {'for': 'golang'}
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    Plug 'vim-scripts/bufkill.vim', {'on': 'BD'}  " kill buffer but not window
    Plug 'airblade/vim-gitgutter'  " show git status in gutter
    Plug 'nathanaelkane/vim-indent-guides'  " display indent level
    Plug 'junegunn/goyo.vim', {'on': 'Goyo'}  " nice focused writing environment
    Plug 'junegunn/limelight.vim', {'on': 'Limelight'}  " powers Goyo
    Plug 'frigoeu/psc-ide-vim', {'for': 'purescript'}  " purescript compiling checker
    Plug 'raichoo/purescript-vim', {'for': 'purescript'}
    Plug 'hdiniz/vim-gradle', {'for': ['gradle']}
    "Plug 'othree/yajs.vim', {'for': 'javascript'}
    "Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
    Plug 'jonsmithers/vim-html-template-literals'
    Plug 'pangloss/vim-javascript'
    Plug 'lambdatoast/elm.vim', {'for': 'elm'}
    Plug 'nikvdp/ejs-syntax', {'for': 'ejs'}
    Plug 'lervag/vimtex', {'for': 'tex'}
    Plug 'godlygeek/tabular' " must be before vim-markdown
    Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'md', 'markdown.pandoc', 'ghmarkdown']}
    Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['markdown', 'md', 'markdown.pandoc', 'ghmarkdown']}
    Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
end
Plug 'solars/github-vim', {'on': 'GithubOpen'}  " open file in github
Plug 'mileszs/ack.vim', {'on': 'Ack'}  " search files
Plug 'junegunn/vim-easy-align'  " align around a certain character
Plug 'scrooloose/nerdcommenter'  " nice commenting

" Themes
if !exists('g:vscode')
    Plug 'chriskempson/base16-vim'  " colors!
end


call plug#end()
