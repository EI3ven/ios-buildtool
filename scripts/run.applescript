tell application "Xcode" to activate
tell application "System Events"
	tell process "Xcode"
		keystroke "r" using {command down}
	end tell
end tell