//
//  Parser.swift
//  xcode-colorful-log
//
//  Created by Furkan Kaplan on 8.01.2022.
//

import Foundation
import OSLog

protocol Parsing {
    var delegate: ParserDelegate? { get set }
    func checkIfMultiline()
    func parse()
}

protocol ParserDelegate: AnyObject {
    func parse(received log: LogEntry)
}

class Parser: Parsing {
    
    private var messages: [String]
    private var dateCreator: DateCreating
    private var filterKey: String
    
    weak var delegate: ParserDelegate?
    
    init(messages: [String], filterKey: String, dateCreator: DateCreating) {
        self.messages = messages
        self.filterKey = filterKey
        self.dateCreator = dateCreator
    }
    
    func checkIfMultiline() {
        self.messages = messages.first?.split(separator: "\n").compactMap { String($0).escape }.filter { $0.contains(self.filterKey) } ?? []
    }
    
    func parse() {
        for message in messages {
            let splitted = message.split(separator: " ", maxSplits: 9).map { String($0) }
            
            guard splitted.count == 10 else { return }
            
            guard let logType: LogType = self.type(of: splitted[3]) else { return }
            
            guard let pid = Int(splitted[5]) else { return }
            
            guard let ttl = Int(splitted[6]) else { return }
            
            let model = LogEntry(
                date: dateCreator.createFrom("\(splitted[0]) \(splitted[1])"),
                thread: splitted[2],
                type: logType,
                activity: splitted[4],
                pid: pid,
                ttl: ttl,
                workspace: splitted[7],
                subSystem: splitted[8],
                category: splitted[8],
                message: splitted[9])
            
            self.delegate?.parse(received: model)
        }
    }
        
}

extension Parser {
    
    private func type(of string: String) -> LogType? {
        switch string {
        case "Error": return .error
        case "Info": return .info
        case "Default": return .`default`
        case "Fault": return .fault
        default: return nil
        }
    }
    
}
