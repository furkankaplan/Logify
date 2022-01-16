//
//  File.swift
//  
//
//  Created by Furkan Kaplan on 16.01.2022.
//

import Foundation

extension String {
    
    func with(color: ANSIColors) -> String {
        return "\(color.value)\(self)"
    }
    
}
