//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.11.20.
//

import Foundation

public struct ElementType {
    var type: String
    
    init(type: String) {
        self.type = type
    }
}

public protocol WithType {
    var type: ElementType { get }
}

extension ElementType: Equatable {
    
}

extension ElementType: Encodable {
    public func encode(to encoder: Encoder) throws {
        try self.type.encode(to: encoder)
    }
}

extension ElementType {
    public static var none: ElementType {
        return ElementType(type: "none")
    }
}
