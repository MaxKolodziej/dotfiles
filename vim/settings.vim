set expandtab

set hidden
set cc=120
set hlsearch
set showcmd
set fileencodings=utf-8,latin2
set encoding=utf-8
set magic
set ignorecase
set t_Co=256

set expandtab
set shiftwidth=2
set softtabstop=2
set synmaxcol=200
" set wildignorecase
set noswapfile
set runtimepath+=~/.vim/ultisnips

" set path+=javascript
" set path+=spec/javascript
set suffixesadd+=.js
set suffixesadd+=.jsx

" set wildignore+=**/tmp/**,*.so,*.swp,*.zip,**/.*/**

"hi CursorColumn term=underline cterm=underline guibg=#F4F4F4 
"hi! link CursorLine CursorColumn 
"au CursorHold,CursorHoldI * set cul cul 
"au CursorMoved,CursorMovedI * if &cul | set nocul nocul | endif 
set updatetime=800
set lazyredraw
set ttyfast
let g:ruby_path="~/.rvm/bin/ruby"

set nu
"set regexpengine=1

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
"let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .ctrlpignore`"'

let g:notes_directories = ['~/Documents/notes']
let g:notes_suffix = '.txt'

let g:highlightMarks_colors = ['#FFFF00', '#FFEE11', '#FFDD22', '#FFCC33', '#FFBB44', '#FFAA55', '#FF9966', '#FF8877']
let g:highlightMarks_useSigns = 1

"fixes telescope pink background color
hi NormalFloat ctermfg=LightGrey

set tags=tags;/
"set rnu "working very slow :/
"
" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-g>"

let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1 

filetype plugin indent on
syntax enable

let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'python': ['flake8', 'pylint'],
\   'javascript': ['prettier','eslint'],
\   'vue': ['eslint']
\}

let g:ale_ruby_rubocop_executable = '/Users/max/.rbenv/shims/rubocop'
au FileType javascript setlocal formatprg=prettier-eslint
au FileType javascript.jsx setlocal formatprg=prettier-eslint
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

let g:ale_fixers = {
  \    'javascript': ['prettier','eslint'],
  \    'typescript': ['prettier','eslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}
let g:ale_fix_on_save = 0
let g:ale_javascript_prettier_options=" --list-different 'javascript/bundles/**/*.{js,es6,jsx,scss}'; prettier --list-different 'spec/javascript/components/**/*.{js,jsx}'"
let g:ale_javascript_eslint_options=" -c .eslintrc --ext js,jsx"

set spell spelllang=en_us

set shortmess=a
set cmdheight=2
let g:bufferline_echo=0
"let g:ctrlspace_set_default_mapping=0
"let g:ctrlspace_default_mapping_key="<C-b>"
let g:gutentags_cache_dir = expand('/Users/max/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_exclude = [
      \ '*.git',
      \ 'public/packs'
      \ ]


function! LightlineCurrentDirectory() abort
  return fnamemodify(getcwd(), ':t')
endfunction

lua << EOF
require('telescope').setup({
  defaults = {
    shorten_path = true,
    layout_config = {
      horizontal = { width = 0.98, mirror = false },
      preview_width = 0.3
    }
  },
})
EOF

"add javascript dir to search path when using `gf` command
set path+=javascript

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'cwd' ],
        \           [ 'readonly', 'relativepath', 'modified' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \  },
      \ 'inactive': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'cwd' ],
        \           [ 'readonly', 'cwd', 'filename', 'modified' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \  },
      \ 'component_function': {
      \   'cwd': 'LightlineCurrentDirectory'
      \  },
      \ 'enable': {
      \   'statusline': 1,
      \   'tabline': 1
      \  },
    \  }
