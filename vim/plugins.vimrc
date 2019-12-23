" -------
" Plugins
" -------

call plug#begin(stdpath('data') . '/plugged')


" General Vim utilities
Plug 'sjl/gundo.vim', {'on': 'GUndoToggle'}  " undo tree visualizer
Plug 'kana/vim-arpeggio'  " press multiple keys to make a chord
Plug 'tpope/vim-surround'  " change surrounding characters
Plug 'Shougo/vimproc.vim', {'do': 'make'}  " async cmd execution
Plug 'sjl/vitality.vim'  " play nice with iterm2 and tmux
Plug 'christoomey/vim-tmux-navigator'  " play nice with tmux splits
Plug 'mattn/calendar-vim', {'on': 'Calendar'}  " little calendar

" IDE
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}  " file explorer
Plug 'vim-scripts/bufkill.vim', {'on': 'BD'}  " kill buffer but not window
Plug 'jlipps/vim-bda', {'on': 'Bda'}  " delete all buffers
Plug 'kien/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMRU']}  " fuzzy file finder
Plug 'airblade/vim-gitgutter'  " show git status in gutter
Plug 'nathanaelkane/vim-indent-guides'  " display indent level
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' " status bar
Plug 'solars/github-vim', {'on': 'GithubOpen'}  " open file in github
Plug 'mileszs/ack.vim', {'on': 'Ack'}  " search files
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}  " nice focused writing environment
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}  " powers Goyo
Plug 'junegunn/vim-easy-align'  " align around a certain character
Plug 'vim-pandoc/vim-pandoc',  {'for': 'markdown'} " helpful markdown / pandoc stuff
Plug 'frigoeu/psc-ide-vim', {'for': 'purescript'}  " purescript compiling checker
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': [':CocInstall coc-java', ':CocInstall coc-omnisharp', ':CocInstall coc-tsserver']}  " code completion based on lang server
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile', 'for': ['java']}  " java language server
Plug 'hdiniz/vim-gradle', {'for': ['gradle']}
Plug 'neomake/neomake', {'on': 'Neomake'}  " maker and linter
Plug 'benjie/neomake-local-eslint.vim'  " auto lint with .eslintrc
Plug 'drewschrauf/neomake-local-tslint.vim'  " auto lint with .tslintrc
Plug 'fatih/vim-go', {'for': 'golang'}
Plug 'scrooloose/nerdcommenter'  " nice commenting
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'raichoo/purescript-vim', {'for': 'purescript'}
Plug 'lambdatoast/elm.vim', {'for': 'elm'}
Plug 'nikvdp/ejs-syntax', {'for': 'ejs'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'}
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}

" Themes
Plug 'chriskempson/base16-vim'  " colors!


call plug#end()
