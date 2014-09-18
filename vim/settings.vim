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

set wildignore+=**/tmp/**,*.so,*.swp,*.zip,**/.*/**

if has("gui_running")
  let g:airline#extensions#tabline#enabled = 0
else
  let g:airline#extensions#tabline#enabled = 1
end
let g:airline#extensions#whitespace#enabled = 0

set guifont=Inconsolata\-dz\ for\ Powerline
let g:Powerline_symbols = 'fancy'

"hi CursorColumn term=underline cterm=underline guibg=#F4F4F4 
"hi! link CursorLine CursorColumn 
"au CursorHold,CursorHoldI * set cul cul 
"au CursorMoved,CursorMovedI * if &cul | set nocul nocul | endif 
set updatetime=800
set lazyredraw
set ttyfast
let g:ruby_path="~/.rvm/bin/ruby"

set nu
set regexpengine=1

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

let g:notes_directories = ['~/Documents/notes']
let g:notes_suffix = '.txt'

set tags=tags;/
"set rnu "working very slow :/
"
"au FocusLost * :set number
"au FocusGained * :set relativenumber

"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby set omnifunc=rubycomplete#Complete
"let g:neocomplcache_enable_fuzzy_completion = 1
"let g:neocomplcache_fuzzy_completion_start_length = 3

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"let g:airline_section_b = ''
filetype plugin indent on
syntax enable
