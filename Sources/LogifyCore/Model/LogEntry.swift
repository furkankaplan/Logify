//
//  LogEntryModel.swift
//  xcode-colorful-log
//
//  Created by Furkan Kaplan on 8.01.2022.
//

import Foundation

struct LogEntry {
    var date: Date
    var thread: String
    var type: LogType
    var activity: String
    var pid: Int
    var ttl: Int
    var workspace: String
    var subSystem: String
    var category: String
    var message: String
}
