tell application "Xcode"
	set _workspace to active workspace document
    set _workspaceFile to file of _workspace
    set _posixTargetPath to POSIX path of _workspaceFile
    return _posixTargetPath
end tell
