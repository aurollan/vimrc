"Vundle setup START
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Include and definition search result in a quick fix window
Plugin 'romainl/vim-qlist'

"Tags file management
Plugin 'ludovicchabant/vim-gutentags'

"Automatic surrounding
Plugin 'tpope/vim-surround'

"Repeat works also with plugin
Plugin 'tpope/vim-repeat'

"Plugin git manager
Plugin 'tpope/vim-fugitive'

"Tabularize text (alternative to lion.vim)
Plugin 'godlygeek/tabular'

"Highlight yank
Plugin 'machakann/vim-highlightedyank'

"Simply beautifull icons
Plugin 'ryanoasis/vim-devicons'

"Gruvbox theme
Plugin 'morhetz/gruvbox'

"C syntax hightlight
Plugin 'octol/vim-cpp-enhanced-highlight'

"Rainbow brackets
Plugin 'luochen1990/rainbow'

"Auto closing brackets
Plugin 'Raimondi/delimitMate'

"Display list of symbol
Plugin 'preservim/tagbar'

"Linter manager
Plugin 'dense-analysis/ale'

"NerdTree
Plugin 'scrooloose/nerdtree'
" Distraction free environment
Plugin 'junegunn/goyo.vim'

Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin  'prabirshrestha/asyncomplete.vim' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle setup END

"Default compiler for linting is gcc, does NOT search for clang
" let g:ale_c_cc_executable = 'gcc'
" let g:ale_cpp_cc_executable = 'gcc'
" Only enable following linter
let g:ale_linters_explicit = 1
" let g:ale_linters = {
" \   'c': ['gcc', 'ccls'],
" \   'cpp': ['gcc', 'ccls']
" \}
"let g:ale_linters = {
"\   'c': ['ccls'],
"\   'cpp': ['ccls']
"\}
"ccls cache information in /tmp
" let g:ale_c_ccls_init_options = {
" \   'cache': {
" \       'directory': '/tmp/ccls/cache'
" \   },
" \   'clang': {
" \       'resourceDir': '/usr/lib/llvm-11/'
" \   }
" \ }
"Enable ALE fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" Run linter on save only
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0

"Open Nerd Panel with a new tab
let sbv_open_nerdtree_to_start=1
"Leave NERDTree if it is last opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Open NERDTree automatically when vim startup
autocmd vimenter * NERDTree
"Go to previous (last accessed) window at entry
autocmd VimEnter * wincmd p
"Open Nerdtree when vim startup up with no specified file
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Select ctags executable
let g:gutentags_ctags_executable = 'ctags-universal'
"Choose trigger to tags update
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
"Gutentags generate tag files in a specific repository
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
"Add extra information on tags
"a: Access (or export) of class members
"i: Inheritance information
"l: Language of input file containing tag
"m: Implementation information
"n: Line number of tag definition
"S: Signature of routine (e.g. prototype or parameter list)
"t: type or typedef definition
let g:gutentags_ctags_extra_args = [
            \ '--fields=+ailmnSt',
            \ ]
"Exclude following file pattern
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

"Activate indentation
set smartindent
" already done by vundle)
" filetype off
" filetype plugin indent on

"Non-expanded, 4-wide tabulations
set tabstop=4
set shiftwidth=4
" Previous
" set noexpandtab
" Actual: tabs are 4 spaces
set expandtab

"Disable vi-compatibility (already done by vundle)
"set nocompatible

"Real-world encoding
set encoding=utf-8

"Interpret modelines in files
set modelines=1

"Do not abandon buffers
set hidden

"Don't bother throttling tty
set ttyfast

"More useful backspace behavior
set backspace=indent,eol,start

"Use statusbar on all windows
set laststatus=2

"Better search
set ignorecase
" if only lowercase = case insensitive
" if with uppercase = case sensitive
set smartcase
set incsearch
set showmatch
set hlsearch

"Set auto indenting
set ai
"Vplit on right of current buffer
set splitright
"Vplit below current buffer
set splitbelow
"Turn hybrid line numbers on
set number relativenumber
"Fuzzy finder with find command
set path+=**
"Diplay all matching files when we tab complete
set wildmenu
"Exclude filetype from wildmenu
set wildignore+=.git\*,*.pyc,*.pyo,*.so,*.o,*.dll,*.lib,*.pyd
"Activate syntax color
syntax on
"Activate spell checking
set spell
"Disable error bell sound
set noerrorbells
"Color 81th charactere on a line
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)
"Display menu even with only one match
" set completeopt=menuone,noinsert,preview,noselect
"Add dictionnary to completion with Ctrl-p
" set complete+=kspell
"Do not print useless info
" set shortmess+=c


"Set syntax color theme
set bg=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"Toggle tagbar with F8 (Plugin)
nmap <F8> :TagbarToggle<CR>

"Enable rainbow brackets (Plugin)
let g:rainbow_active = 1

" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls', '--log-file=/home/aurollan/ccls.log -v=1']},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
   	  \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json'] ))},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

function! s:on_lsp_buffer_enabled() abort
    autocmd FileType c setlocal omnifunc=lsp#complete
    autocmd FileType cpp setlocal omnifunc=lsp#complete
    autocmd FileType objc setlocal omnifunc=lsp#complete
    autocmd FileType objcpp setlocal omnifunc=lsp#complete
    " refer to doc to add more commands
endfunction

let g:lsp_diagnostics_echo_cursor = 1

" open auto quickfix windows if populated by a command
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END
