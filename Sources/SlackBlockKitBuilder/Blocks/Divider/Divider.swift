//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Divider: BlockElement {
    public var type: ElementType {
        return .divider
    }
    
    public init() {
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
    }
    
    enum CodingKeys: CodingKey {
        case type
    }
}

extension ElementType {
    static var divider: ElementType {
        return ElementType(type: "divider")
    }
}
