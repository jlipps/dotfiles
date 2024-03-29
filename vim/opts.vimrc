" --------------
" Basic options
" --------------

filetype plugin indent on
syntax on
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nocompatible
set modelines=0
set t_Co=256
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set undofile
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=99
set formatoptions=qrn1
set colorcolumn=100
set list
set listchars=tab:▸\ ,eol:¬
set wildignore+=*.un~,*.swp,*.pyc,*.git,*.swo

" --------------
" Plugin options
" --------------

let g:python3_host_prog = '/usr/local/bin/python3'

" ctrl-p options
let g:ctrlp_extensions = ['tag']
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]
let g:ctrlp_match_window = 'top,order:ttb,max:10,min:10'
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_mruf_relative = 1

" svelte
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0

" react
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" neomake
let g:neomake_java_enabled_makers = []
let g:neomake_cpp_enabled_makers = []
let g:neomake_javascript_enabled_makers = []
let g:neomake_typescript_enabled_makers = []
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_python_enabled_makers = []
let g:neomake_markdown_enabled_makers = ['markdownlint']
let g:neomake_markdown_markdownlint_maker = { 'args': ['--disable', 'MD013'] }
let g:neomake_scss_enabled_makers = []
let g:neomake_css_enabled_makers = []
let g:neomake_warning_sign={'text': '⚠', 'texthl': 'Todo'}
let g:neomake_error_sign={'text': '✗', 'texthl': 'Error'}

" nerdtree options
let NERDTreeIgnore=['\.pyc$', '\~$']

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_tomorrow'
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'help', 'mail', 'markdown', 'org', 'rst', 'tex', 'text', 'pandoc']

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 1

" markdown
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
