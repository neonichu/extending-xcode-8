//
//  SourceEditorCommand.swift
//  Crash Extension
//
//  Created by Boris Bügling on 15/09/2016.
//  Copyright © 2016 👹. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        if let last = invocation.commandIdentifier.components(separatedBy: "_").last, let number = Int(last) {
            switch (number) {
            case 0:
                invocation.buffer.completeBuffer = ""
            case 1:
                invocation.buffer.selections.removeAllObjects()
            case 2:
                // while user has a selection
                invocation.buffer.lines.removeAllObjects()
            /*case 3:
                let pos = XCSourceTextPosition(line: Int(INT_MAX), column: Int(INT_MAX))
                let range = XCSourceTextRange(start: pos, end: pos)
                invocation.buffer.selections.removeAllObjects()
                invocation.buffer.selections.add(range)*/
            default:
                fatalError("Unimplemented command \(number)")
            }
        }

        completionHandler(nil)
    }
    
}
