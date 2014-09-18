function! RunInTerminal(file)
  if match(a:file, '_spec\.rb') != -1
    let l:command = 'rt'
  elseif match(a:file, '\.rb') != -1
    let l:command = 'ruby'
  endif
 
  if exists("l:command")
    let g:last_run_in_terminal = a:file
    let l:run_script = "!osascript ~/.vim/run_command.applescript" 
    silent execute ":up"
    "if has('unix')
    "  silent execute "!~/.vim/ttyecho -n /dev/pts/" . g:vim_terminal . " " . l:command . " " . a:file . " &"
    "else "if has('mac')
    "silent execute "!~/.vim/ttyecho -n /dev/ttys00" . g:vim_terminal . " " . l:command . " " . a:file . " &"
    "silent execute l:run_script . " '" . l:command . " " . a:file . "' /dev/ttys0" . g:vim_terminal . " &"
     silent execute l:run_script . " '" . l:command . " " . a:file . "' &"
    "end
    silent execute ":redraw!"
  else
    echo "Couldn't figure out how to run " . a:file 
  end
endfunction

function! RunCommandInTerminal(user_command)
  let l:run_script = "!osascript ~/.vim/run_command.applescript" 
  silent execute ":up"
  echo l:run_script . " '" . a:user_command . "' &"
  silent execute l:run_script . " '" . a:user_command . "' &"
endfunction
 
function! RunFileInTerminal()
"  if exists("g:vim_terminal")
   call RunInTerminal(expand("%")) 
"  else
"  echo "You need to set g:vim_terminal to a valid TTY (e.g. /dev/ttys000)"
endfunction
 
function! RunFileAtLineInTerminal()
  call RunInTerminal(expand("%") . ":" . line("."))
endfunction
 
function! ReRunLastFileCommand()
  if exists("g:last_run_in_terminal")
    call RunInTerminal(g:last_run_in_terminal)
  endif
endfunction
 
command! RunFileInTerminal call RunFileInTerminal()
command! RunFileAtLineInTerminal call RunFileAtLineInTerminal()
command! ReRunLastFileCommand call ReRunLastFileCommand()
map ta :RunFileInTerminal<CR>
map to :RunFileAtLineInTerminal<CR>
map tl :ReRunLastFileCommand<CR>
