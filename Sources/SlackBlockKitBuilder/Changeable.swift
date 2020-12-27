//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.12.20.
//

import Foundation

protocol Changeable {
    func changing(_ change: (inout Self) -> Void) -> Self
}

extension Changeable {
    func changing(_ change: (inout Self) -> Void) -> Self {
        var copy = self
        change(&copy)
        return copy
    }
}
