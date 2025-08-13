nnoremap ; :
imap <C-d> <del>

function! InsertSingle()
  sleep 700m|let l:a = getchar(0)
  if l:a != 0
    silent! exec "normal i" . nr2char(l:a)
  else
    silent! exec "normal i "
  endif
endfunction
nnoremap <silent> <Space> :call InsertSingle()<CR>

nmap <C-d> vip=
"map <F2> :mksession! ~/vim_session <cr>
"map <F3> :source ~/vim_session <cr>

map <S-Enter> O<Esc>j
map <CR> o<Esc>k

noremap <F4> :%s/\([^{ ]*\)\:/:\1 =>/g<cr>
noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>
noremap <D-7> :tabn 7<CR>
noremap <D-8> :tabn 8<CR>
noremap <D-9> :tabn 9<CR>
noremap <D-0> :tablast<CR>
noremap <m-1> :tabn 1<CR>
noremap <m-2> :tabn 2<CR>
noremap <m-3> :tabn 3<CR>
noremap <m-4> :tabn 4<CR>
noremap <m-5> :tabn 5<CR>
noremap <m-6> :tabn 6<CR>
noremap <m-7> :tabn 7<CR>
noremap <m-8> :tabn 8<CR>
noremap <m-9> :tabn 9<CR>
noremap <m-0> :tablast<CR>

noremap H ^
noremap L $

"ctr-c paste
vmap <C-c> "+y
vmap <C-x> "+c
"Paste only works in Visual and insert mode, so you don't have to worry about the conflict with Ctrl-V and blockwise Visual Mode.
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
" paste in command line with CTRL-V
cmap <C-V> <C-R>+

map <C-S-h> :execute "tabmove" tabpagenr() - 2 <CR>
map <C-S-l> :execute "tabmove" tabpagenr() <CR>
map <D-H>  :tabprev<CR>
map <D-L>  :tabnext<CR>
map <m-h>  :tabprev<CR>
map <m-l>  :tabnext<CR>
nnoremap gf <C-w>gf

map te :Texplore<CR>
map tw :bd<CR>
map tb :tabo<CR>
map tn :tab new<Space>
map th :tab new %:p:h/
map tp :tab new <C-r>+<CR>

if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" shift-enter adds END tag
if !exists( "*EndToken" )
  function EndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    if match( current_line, braces_at_end ) >= 0
      return '}'
    else
      return 'end'
    endif
  endfunction
endif

imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O


map <F7> gg=G<C-o><C-o>
vnoremap <C-k> "ky
nmap <C-k> "kp
vnoremap <C-j> "jy
nmap <C-j> "jp

nnoremap <leader>r orescue StandardError => e<esc>oputs e.message<esc>oputs e.backtrace<esc>oraise<esc>
vnoremap <leader>h yOputs(<esc>p$a).inspect<esc>Oputs '----<esc>p$a-----'<esc>
nnoremap <leader>h ^v$yoputs '----<esc>p$a-----'<esc>
vnoremap <leader>c yOconsole.log(<esc>p$a).inspect<esc>Oconsole.log '----<esc>p$a-----'
"nnoremap <leader>h <esc>^iputs(<esc>A).inspect<esc>
"nnoremap <leader>c ^iconsole.log(<esc>A)<esc>
"noremap <leader>hm ^v$yko<esc>p^i'----<esc>A----'<esc>

"map <silent> w <Plug>CamelCaseMotion_w
nmap ww :w<CR>
nmap <c-w> :q<CR>
"nmap w0 :SetRating 0<CR>
"nmap w1 :SetRating 20<CR>
"nmap w2 :SetRating 40<CR>
"nmap w3 :SetRating 60<CR>
"nmap w4 :SetRating 80<CR>
"nmap w5 :SetRating 100<CR>

" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
"sunmap w
" sunmap b
" sunmap e

command! -nargs=? -complete=file E tab new <args>
command! -nargs=? -complete=file EC tab new %:p:h/<args>
command! -nargs=1 Term let g:vim_terminal=<args>
command! Mappings E ~/dotfiles/vim/mappings.vim
command! Keys E ~/dotfiles/vim/mappings.vim
command! Settings E ~/dotfiles/vim/settings.vim
command! Manager E ~/dotfiles/vim/plug.vim
command! Private E ~/.private_profile
command! Public E ~/.public_profile
command! Scripts tab new ~/scripts.txt <bar> set ft=txtfmt
command! PrettyJson :%!jq .
vnoremap <C-o> :'<,'>:!jq<CR>
command! -nargs=0 Mr RemoveMarkHighlights

function! RubyFilename(selection, spec_file)
  if a:spec_file
    let file_extension = "_spec.rb"
  else
    let file_extension = ".rb"
  endif

  let search_for = '\(\<\u\l\+\|\l\+\)\(\u\)'
  let replace_with = '\l\1_\l\2'
  let file_name = tolower(substitute(a:selection, search_for, replace_with, "g"))
  let full_name = file_name . file_extension
  echom l:full_name
  execute 'Rename' l:full_name
endfunction
nnoremap rfc :call RubyFilename(expand('<cword>'),0)<CR><esc>
nnoremap rfs :call RubyFilename(expand('<cword>'),1)<CR><esc>

" command! -nargs=1 RunCommandInTerminal call RunCommandInTerminal("vg " . <args>)
" map ma yiw:RunCommandInTerminal('<C-r>"')<CR>
" vnoremap ma y:RunCommandInTerminal('<C-r>"')<CR>

let g:EasyMotion_leader_key = ','
let g:EasyMotion_do_mapping = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ012347890'

let g:EasyMotion_mapping_w = 's'
let g:EasyMotion_mapping_b = 'S'

xnoremap u <nop>
xnoremap U <nop>
"
" Quickly edit/reload the vimrc file
command! -nargs=0 Reload so $MYVIMRC
command! -nargs=0 RefreshCode windo e!

" Find this definition 
" map mm :call CscopeFind('g', expand('<cword>'))<CR> 
" Find all calls 
" map mc :call CscopeFind('c', expand('<cword>'))<CR> 
" Find this text string
" map ms :call CscopeFind('t', expand('<cword>'))<CR>

nnoremap ca :let @+=expand("%:p")<CR>
nnoremap cp :let @+=expand("%")<cr>
nnoremap cl :let @+=expand("%") . ':' . line('.')<CR>

function IndentV()
  Tabularize /\(\w\+\ze\s\+: \|: \)/l0l1
endfunction
map <Leader>iv :call IndentV()<cr>

nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

" jump to tag in a new tab
nmap g<C-]> :execute 'tab tag '.expand('<cword>')<CR>

function! SearchForClassWithNamespaces()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  let selection = join(lines,'\n')
  let change = substitute(selection, '::', '/', 'g')
  execute ":Telescope find_files default_text=".change
endfunction

nmap ff :Telescope find_files<CR>
nmap fn :execute 'Telescope find_files default_text=' . expand('<cword>')<cr>
nmap fs :lua require'telescope.builtin'.grep_string{}<CR>
vnoremap fn :call SearchForClassWithNamespaces()<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! DejaVu Sans Mono:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>
