function! PlaySongInItunes(artist, title)
  let l:run_script = "!osascript ~/.vim/play_song_in_itunes.applescript" 
  silent execute l:run_script . " 'play' '" . a:artist . "' '" . a:title . "' "
endfunction

function! SetRating(rating)
  let l:run_script = "!osascript ~/.vim/play_song_in_itunes.applescript" 
  silent execute l:run_script . " 'set_rating' '" . a:rating . "' "
endfunction

function! s:getchar()
  let c = getchar()
  if c =~ '^\d\+$'
    let c = nr2char(c)
  endif
  return c
endfunction

function! InteractiveSongChoose()
  let char = ""
  let song = ""
  let title = ""
  let artist = ""
  let g:song = ''
  let track_names = ''
  echo "Start typing artist and title"
  while char !~ '\r' && g:song == ''
    let char = s:getchar()
    if char == "\<BS>"
      if !empty(artist)
        let song = substitute(song, "\r", '', 'g')
        let song = substitute(song, "\n", '', 'g')
        let input_length = len(song) - 2 "trim 1 char
        let song = song[0:input_length]
      endif
    else
      let song = song . char
    endif
    echom song
    let artist = matchstr(song, '\zs[a-zA-Z]*\ze\s*[a-zA-Z]*')
    let title = matchstr(song, '[a-zA-Z]*\s*\zs[a-zA-Z ]*\ze')
    if !empty(artist) && len(artist) > 1 && empty(title)
      let l:run_script = "osascript ~/.vim/play_song_in_itunes.applescript" 
      let artist = system(l:run_script . " 'find_artist' '" . artist .  "' ")
      let artist = substitute(artist, "\r", '', 'g')
      let artist = substitute(artist, "\n", '', 'g')
      echom artist
    endif
    if !empty(artist) && !empty(title) && len(title) > 1
      let l:run_script = "osascript ~/.vim/play_song_in_itunes.applescript" 
      let track_names = system(l:run_script . " 'play' '" . artist .  "' '" . title .  "'")
      let track_names = substitute(track_names, "\r", '', 'g')
      let track_names = substitute(track_names, "\n", '', 'g')
      let tracks = split(track_names, ",")
      echom track_names
      if len(tracks) == 1
        let g:song = track_names
      endif
    endif

  endwhile
endfunction


command! -nargs=* PlaySongInItunes call PlaySongInItunes(<args>)
command! -nargs=1 SetRating call SetRating(<args>)
command! -nargs=0 InteractiveSongChoose call InteractiveSongChoose()

