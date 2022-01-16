//
//  Logifier.swift
//  xcode-colorful-log
//
//  Created by Furkan Kaplan on 13.01.2022.
//

import Foundation
import ArgumentParser

public struct Logifier: ParsableCommand {
    
    @Argument(help: "Composition of subsystem and category with colon seperator. Ex: sub.system:category.name")
    var filter: String
    
    public init() { }
    
    mutating public func run() throws {
        guard filter.split(separator: ":").count == 2 else {
            print("Invalid parameter. Valid parameter must be like that subsystem:category")
            return
        }
        
        let result: Running = Runner(injector: DependencyContainer(key: filter))
        result.log()
    }
    
}
