on findArtist(_artist)
  tell application "iTunes"
    set _artistList to {}
    set _found to (file tracks whose artist contains _artist)
    repeat with t in _found
      set _artistName to artist of t
      if _artistName is not in _artistList
        set _artistList to _artistList & _artistName
      end if
      #set _titleName to name of t
      #set _trackList to _trackList & {_artistName & " - " & _titleName}
    end repeat
    #set _artists to joinList _artistList, ","
    #set _artists to implode_explode(_artistList, ",")
    #return _artists
    return _artistList
  end tell
end findArtist

on find(_artist, _title)
  tell application "iTunes"
    set _trackList to {}
    set _found to (file tracks whose name contains _title and artist contains _artist)
    repeat with t in _found
      set _artistName to artist of t
      set _titleName to name of t
      set _trackList to _trackList & {_artistName & " - " & _titleName}
    end repeat
    return _trackList
  end tell
end find

on play(_artist, _title)
  tell application "iTunes"
    set _found to (file tracks whose name contains _title and artist contains _artist)
    if length of _found is greater than 1
      return my find(_artist, _title)
    else
      set _track to item 1 of _found
      play _track
      reveal _track
      return {artist of _track & " - " & name of _track}
    end if
  end tell
end play

on run argv
  set _command to item 1 of argv
  if length of argv is 3
    set _artist to item 2 of argv
    set _title to item 3 of argv
    if _command is "find"
      return find(_artist, _title)
    end if

    if _command is "play"
      return play(_artist, _title)
    end if
  end if

  if length of argv is 2
    if _command is "set_rating"
      set _rating to item 2 of argv
      return setRating(_rating)
    end if

    if _command is "find_artist"
      set _artist to item 2 of argv
      return findArtist(_artist)
    end if
  end if
end run

on setRating(_rating)
  tell application "iTunes"
    set _currentTrack to current track
    set rating of _currentTrack to _rating as integer
  end tell
end setRating

