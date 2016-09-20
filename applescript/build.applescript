tell application "Xcode"
	set _workspace to active workspace document
    set _scheme to active scheme of _workspace
    
    set actionResult to build _workspace
	repeat
    	if completed of actionResult is true then
        	exit repeat
    	end if
    	delay 0.5
	end repeat

	set _status to status of actionResult
	return _status
end tell
