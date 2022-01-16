//
//  Painter.swift
//  xcode-colorful-log
//
//  Created by Furkan Kaplan on 9.01.2022.
//

import Foundation

protocol Painting {
    func printLog()
}

class Painter: Painting {
    
    private let log: LogEntry
    private let dateCreator: DateCreating
    
    init(log: LogEntry, dateCreator: DateCreating) {
        self.log = log
        self.dateCreator = dateCreator
    }
    
    func printLog() {
        let color:  ANSIColors
        
        switch log.type {
        case .`default`: color = .white
        case .error: color = .red
        case .fault: color = .magenta
        case .info: color = .cyan
        }
        
        var message: String = ""
        
        message.append("[")
        message.append(dateCreator.createFrom(log.date))
        message.append("]")
        
        message.append(" ")
    
        message.append(log.message)
        
        print(message.with(color: color))
    }
    
}
