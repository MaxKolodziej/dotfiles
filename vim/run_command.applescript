on appIsRunning(appName)
  tell application "System Events" to (name of processes) contains appName
end appIsRunning
 
on execInItermTab(_terminal, _session, _command)
  tell application "iTerm"
    activate
    set current terminal to _terminal
    tell _session
      write text _command
    end tell
  end tell
end selectTerminalTab
 
on run argv
  set _command to item 1 of argv
  -- Second argument should be the tty to look for
  if length of argv is 1
    if appIsRunning("iTerm") then
      tell application "iTerm"
        set _terminal to current terminal
        set _session to current session of current terminal
      end tell
      execInItermTab(_terminal, _session, _command)
    end if
  end if
end run
