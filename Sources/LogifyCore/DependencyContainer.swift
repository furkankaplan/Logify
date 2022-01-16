//
//  DependencyContainer.swift
//  xcode-colorful-log
//
//  Created by Furkan Kaplan on 10.01.2022.
//

import Foundation

protocol DependencyInjecting {
    func command() -> Commanding
    func parser(_ message: String) -> Parsing
    func painter(_ log: LogEntry) -> Painting
}

class DependencyContainer: DependencyInjecting {
    
    private let key: String
    
    init(key: String) {
        self.key = key
    }
    
    func command() -> Commanding {
        Commander(key: self.key)
    }
    
    func parser(_ message: String) -> Parsing {
        Parser(messages: [message], filterKey: self.key, dateCreator: DateCreator())
    }
    
    func painter(_ log: LogEntry) -> Painting {
        Painter(log: log, dateCreator: DateCreator())
    }
    
}
