//
//  SourceEditorExtension.swift
//  Crash Extension
//
//  Created by Boris Bügling on 15/09/2016.
//  Copyright © 2016 👹. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        return (0..<3).map {
            return [ XCSourceEditorCommandDefinitionKey.classNameKey: SourceEditorCommand.className(),
                     XCSourceEditorCommandDefinitionKey.identifierKey: "crash_command_\($0)",
                     XCSourceEditorCommandDefinitionKey.nameKey: "Crash \($0)" ]
        }
    }
}
