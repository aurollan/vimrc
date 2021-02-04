"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGINS MANAGER                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle setup START
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""MANDATORY"""""""""""""""""""""""""""""""""

" Tags file management plugin
Plugin 'ludovicchabant/vim-gutentags'

" Automatic surrounding
Plugin 'tpope/vim-surround'

" Repeat key (.) works also with plugin
Plugin 'tpope/vim-repeat'

" Git wapper
Plugin 'tpope/vim-fugitive'


"""""""""""""""""""""""""""""""""PERSONNAL"""""""""""""""""""""""""""""""""

" Include and definition search result in a quick fix window
Plugin 'romainl/vim-qlist'

" Display list of symbol
Plugin 'preservim/tagbar'

" Tabularize text (alternative to lion.vim)
Plugin 'godlygeek/tabular'

" Highlight yank (nice to see if yank is correct before pasting)
Plugin 'machakann/vim-highlightedyank'


"""""""""""""""""""""""""""""""""ESTHETIC"""""""""""""""""""""""""""""""""
" Rainbow brackets
Plugin 'luochen1990/rainbow'

" Gruvbox theme
Plugin 'morhetz/gruvbox'

" C syntax hightlight works great with enought coloration
Plugin 'octol/vim-cpp-enhanced-highlight'

" Auto closing brackets
Plugin 'Raimondi/delimitMate'


""""""""""""""""""""""""""""""""VIM AS IDE""""""""""""""""""""""""""""""""
" Linter manager (very good plugin)
" Plugin 'dense-analysis/ale'

" NerdTree (file tree viewer working like any other IDE)
" Plugin 'scrooloose/nerdtree'

" Simply beautifull icons (Nice with NERDTree)
" Plugin 'ryanoasis/vim-devicons'

" Distraction free environment
Plugin 'junegunn/goyo.vim'

" C syntax hightlight using LSP works great but I don't like the colors
" Plugin 'jackguo380/vim-lsp-cxx-highlight'

" Vim lsp client
Plugin 'prabirshrestha/vim-lsp'

" Vim lsp feature for autocomplete
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin  'prabirshrestha/asyncomplete.vim' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle setup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               VIM SETUP                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Activate indentation
set smartindent

" Non-expanded, 4-wide tabulations
set tabstop=4
set shiftwidth=4

" Convert tab to space
set expandtab

" Real-world encoding
set encoding=utf-8

" Interpret modelines in files
set modelines=1

" Do not abandon buffers
set hidden

" Don't bother throttling tty
set ttyfast

" More useful backspace behavior
set backspace=indent,eol,start

" Use statusbar on all windows
set laststatus=2

" highlight the matching character
set showmatch

" Better search
set ignorecase

" Smartcase is:
" if only lowercase = case insensitive
" if with uppercase = case sensitive
set smartcase

" Search as you type
set incsearch

" highlight search match
set hlsearch

" Vplit on right of current buffer
set splitright

" Vplit below current buffer
set splitbelow

" Turn hybrid line numbers on
set number relativenumber

" Fuzzy finder with find command
set path+=**

" Diplay all matching files when we hit tab
set wildmenu

" Exclude filetype from wildmenu
set wildignore+=.git\*,*.pyc,*.pyo,*.so,*.o,*.dll,*.lib,*.pyd,*.d

" Activate syntax color
syntax on

" Activate spell checking
set spell

" Disable error bell sound
set noerrorbells

" Color 81th charactere on a line
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" Display menu even with only one match
"set completeopt=menuone,noinsert,preview,noselect
" Add dictionnary to completion with Ctrl-p
"set complete+=kspell
" Do not print useless info - note: I Find those info USEFULL
"set shortmess+=c

" Enable doxygen syntax highlight
let g:load_doxygen_syntax = 1

" Vim theme
set bg=dark
colorscheme gruvbox

" open auto quickfix windows if populated by a command
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGIN SETUP                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""GUTENTAGS""""""""""""""""""""""""""""""""

" Select ctags executable
let g:gutentags_ctags_executable = 'ctags-universal'

" Choose trigger to tags update
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" Gutentags generate tag files in a specific repository
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
" Add extra information on tags
"  a: Access (or export) of class members
"  i: Inheritance information
"  l: Language of input file containing tag
"  m: Implementation information
"  n: Line number of tag definition
"  S: Signature of routine (e.g. prototype or parameter list)
"  t: type or typedef definition
let g:gutentags_ctags_extra_args = [
            \ '--fields=+ailmnSt',
            \ ]
" Exclude following file pattern
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ '*/Demo/*',
      \ '*test*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'ccls*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]


""""""""""""""""""""""""""""""""GRUVBOX""""""""""""""""""""""""""""""""
" Set syntax color theme (Plugin)
let g:gruvbox_contrast_dark='hard'

"""""""""""""""""""""""""""""""""TAGBAR""""""""""""""""""""""""""""""""
" Toggle tagbar with F8 (Plugin)
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""RAINBOW BRACKETS"""""""""""""""""""""""""""
" Enable rainbow brackets (Plugin)
let g:rainbow_active = 1


""""""""""""""""""""""""""""""""VIM LSP""""""""""""""""""""""""""""""""
" Register ccls C++ language server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'initialization_options': {
      \                             'cache': {'directory': '/tmp/ccls/cache' },
      \                             'highlight': { 'lsRanges' : v:true },
      \                           },
   	  \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json'] ))},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Replace omnifunc with lsp function for autocompletion
function! s:on_lsp_buffer_enabled() abort
    autocmd FileType c setlocal omnifunc=lsp#complete
    autocmd FileType cpp setlocal omnifunc=lsp#complete
    autocmd FileType objc setlocal omnifunc=lsp#complete
    autocmd FileType objcpp setlocal omnifunc=lsp#complete
    " refer to doc to add more commands
endfunction

" Display diagnostic on cursor
let g:lsp_diagnostics_echo_cursor = 1

" Used to debug lsp issues
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = 'vim-lsp.log'
