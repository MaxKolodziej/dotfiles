on appIsRunning(appName)
  tell application "System Events" to (name of processes) contains appName
end appIsRunning
 
on run argv
  set _command to item 1 of argv
  if length of argv is 1
    if appIsRunning("MacVim") then
      tell application "MacVim"
        activate
      end tell
      tell application "System Events"
        key code 53 #escape
        delay 1.5
        keystroke _command
        key code 52 #enter
      end tell
    end if
  end if
end run
