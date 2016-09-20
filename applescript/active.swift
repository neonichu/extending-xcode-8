#!/usr/bin/xcrun swift

import Foundation

enum Error: ErrorProtocol {
	case FailedToExecuteAppleScript
	case NSAppleScriptErrorMessage(message: String)
}

func runAppleScript(_ script: String) throws -> String {
  if let scriptObject = NSAppleScript(source: script) {
  	var error: NSDictionary?
  	if let output: NSAppleEventDescriptor = scriptObject.executeAndReturnError(&error) {
  	  return output.stringValue ?? ""
  	} else if let error = error {
  	  let message = error["NSAppleScriptErrorMessage"] as! String
  	  throw Error.NSAppleScriptErrorMessage(message: message)
  	}
  }

  throw Error.FailedToExecuteAppleScript
}

let script = "tell application \"Xcode\"\n" +
	"set _workspace to active workspace document\n" +
    "set _workspaceFile to file of _workspace\n" +
    "set _posixTargetPath to POSIX path of _workspaceFile\n" +
    "return _posixTargetPath\n" +
"end tell"
print(try! runAppleScript(script))
