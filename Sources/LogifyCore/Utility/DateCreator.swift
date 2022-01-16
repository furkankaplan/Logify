//
//  File.swift
//  
//
//  Created by Furkan Kaplan on 16.01.2022.
//

import Foundation

protocol DateCreating {
    func createFrom(_ string: String) -> Date
    func createFrom(_ date: Date) -> String
}

class DateCreator: DateCreating {
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        return dateFormatter
    }
    
    func createFrom(_ string: String) -> Date {
        return dateFormatter.date(from:string) ?? Date()
    }
    
    func createFrom(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
}
