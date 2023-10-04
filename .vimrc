"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGIN  MANAGER                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

"""""""""""""""""""""""""""""""""""MANDATORY"""""""""""""""""""""""""""""""""""

" Tags file management plugin
" Plug 'ludovicchabant/vim-gutentags'

" Automatic surrounding
Plug 'tpope/vim-surround'

" Repeat key (.) works also with plugin
Plug 'tpope/vim-repeat'

" Git wapper
Plug 'tpope/vim-fugitive'

" File tree viewer designed to work with vim built-in mecanisms
Plug 'justinmk/vim-dirvish'

"""""""""""""""""""""""""""""""""""PERSONNAL"""""""""""""""""""""""""""""""""""

" Display list of symbol (use tags)
" Plug 'preservim/tagbar'

" Tabularize text (alternative to lion.vim)
Plug 'godlygeek/tabular'

" Highlight yank (nice to see if yank is correct before pasting)
Plug 'machakann/vim-highlightedyank'


" Use FZF to search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"""""""""""""""""""""""""""""""""""ESTHETIC""""""""""""""""""""""""""""""""""""
" Rainbow brackets
Plug 'luochen1990/rainbow'

" Syntax theme
Plug 'srcery-colors/srcery-vim'
Plug 'morhetz/gruvbox'

" Auto closing brackets
Plug 'Raimondi/delimitMate'

" Plug 'junegun/vim-peekaboo'
Plug 'junegunn/limelight.vim'

" Vim startup screen (nice starting screen)
Plug 'mhinz/vim-startify'

""""""""""""""""""""""""""""""""""VIM AS IDE"""""""""""""""""""""""""""""""""""
" Linter and static analyzer manager (very good plugin)
Plug 'dense-analysis/ale'

" Vim lsp client
Plug 'prabirshrestha/vim-lsp'

" Vim lsp feature for autocomplete
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'

" Vim lsp settings to install and setup lsp easily
Plug 'mattn/vim-lsp-settings'

" Markdown viewer
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               VIM SETUP                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show typed commands and improve visual selection information
set showcmd

" Show line, column and relative position in file
set ruler

" Start scrolling when I'm 3 lines from top/bottom
set scrolloff=3

" Auto indentation
set smartindent
set autoindent

" Non-expanded, 4-wide tabulations
set tabstop=4
set shiftwidth=4

" Convert tab to space
set expandtab

" Real-world encoding
set encoding=utf-8

" Interpret only 1 modeline in files (vim setup at the beginning of a file)
set modelines=1

" Do not abandon buffers
set hidden

" Don't bother throttling tty
set ttyfast

" Set expected backspace behavior
set backspace=indent,eol,start

" Use statusbar on all windows
set laststatus=2

" Highlight the matching character (useful for brackets)
set showmatch

" Better search
" if only lowercase = case insensitive
" if with uppercase = case sensitive
set ignorecase
set smartcase

" Search as you type
set incsearch

" Highlight search match
set hlsearch

" Vplit on right of current buffer
set splitright

" Vplit below current buffer
set splitbelow

" Turn hybrid line numbers on
set number relativenumber

" Fuzzy finder with find command
set path+=**

" Display all matching files when we hit tab
set wildmenu

" Exclude filetype from wildmenu
set wildignore+=.git\*,*.pyc,*.pyo,*.so,*.o,*.dll,*.lib,*.pyd,*.d

" Activate syntax color
syntax on

" Activate spell checking
set spell
set spelllang=en

" Disable error bell sound
set noerrorbells

" Highlight cursor line
set cursorline

" Color 81th character on a line
set colorcolumn=81
highlight ColorColumn ctermbg=red

" Display menu even with only one match
set completeopt+=menuone

" Add dictionary to completion with Ctrl-p
set complete+=kspell

" Enable Doxygen syntax highlight
let g:load_doxygen_syntax = 1

" Theme setup
set termguicolors
let g:gruvbox_contrast_dark='hard'
set background=dark
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

"""""""""""""""""""""""""""""""""GUTENTAGS"""""""""""""""""""""""""""""""""""""
" Ctags management is disabled because it destroy my RAM

" Select ctags executable
" let g:gutentags_ctags_executable = 'ctags'

" Choose trigger to tags update
" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0

" Gutentags generate tag files in a specific repository
" let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

" Add extra information on tags
"  a: Access (or export) of class members
"  i: Inheritance information
"  l: Language of input file containing tag
"  m: Implementation information
"  n: Line number of tag definition
"  S: Signature of routine (e.g. prototype or parameter list)
"  t: type or typedef definition
" let g:gutentags_ctags_extra_args = [
"             \ '--fields=+ailmnSt',
"             \ ]
" Exclude following file pattern
" let g:gutentags_ctags_exclude = [
"       \ '*.git', '*.svg', '*.hg',
"       \ '*/tests/*',
"       \ '*/Demo/*',
"       \ '*test*',
"       \ 'build',
"       \ 'dist',
"       \ '*sites/*/files/*',
"       \ 'bin',
"       \ 'node_modules',
"       \ 'bower_components',
"       \ 'cache',
"       \ 'compiled',
"       \ 'docs',
"       \ 'example',
"       \ 'bundle',
"       \ 'vendor',
"       \ '*.md',
"       \ '*-lock.json',
"       \ '*.lock',
"       \ '*bundle*.js',
"       \ '*build*.js',
"       \ '.*rc*',
"       \ '*.json',
"       \ '*.min.*',
"       \ '*.map',
"       \ '*.bak',
"       \ '*.zip',
"       \ '*.pyc',
"       \ '*.class',
"       \ '*.sln',
"       \ '*.Master',
"       \ '*.csproj',
"       \ '*.tmp',
"       \ '*.csproj.user',
"       \ '*.cache',
"       \ '*.pdb',
"       \ 'tags*',
"       \ 'ccls*',
"       \ '.ccls*',
"       \ 'cscope.*',
"       \ '*.css',
"       \ '*.less',
"       \ '*.scss',
"       \ '*.exe', '*.dll',
"       \ '*.mp3', '*.ogg', '*.flac',
"       \ '*.swp', '*.swo',
"       \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
"       \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
"       \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
"       \ ]


"""""""""""""""""""""""""""""""""""""TAGBAR""""""""""""""""""""""""""""""""""""
" Toggle tagbar with F8 (Plugin)
" nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""RAINBOW BRACKETS"""""""""""""""""""""""""""""""
" Enable rainbow brackets (Plugin)
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""ALE"""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'c': ['cppcheck', 'flawfinder', 'clangtidy'],
\   'python': ['pylint', 'pydocstyle', 'flake8', 'bandit'],
\   'cpp': ['cppcheck', 'flawfinder', 'cpplint', 'clangtidy'],
\   'bash': ['shellcheck',]
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'rust': ['rustfmt'],
\}

" Give the of the linter
let g:ale_echo_msg_format = '[%linter%]: %s'

" Option send to cppcheck
let g:ale_cpp_cppcheck_options = '--enable=all'
let g:ale_c_cppcheck_options = '--enable=all'

" Option send to clang-tidy
let g:ale_cpp_clangtidy_checks = ['*']
let g:ale_c_clangtidy_checks = ['*']

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Stop linter while I type
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" Run linter on opening a file
let g:ale_lint_on_enter = 0
" Set this variable to 1 to lint files when you save them.
let g:ale_lint_on_save = 1

""""""""""""""""""""""""""""""""""""VIM MARKDOWN"""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""""""""VIM LSP""""""""""""""""""""""""""""""""""""
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

" Enable Lsp semantic token highlight
let g:lsp_semantic_enabled = 1

" Enable inlay hints if conditions are met by vim setup
let g:lsp_inlay_hints_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_align = "after"
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
let g:lsp_diagnostics_virtual_text_prefix = " ‣ "
let g:lsp_diagnostics_virtual_text_wrap = "truncate"

" Used to debug lsp issues
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = 'vim-lsp.log'
