//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

public struct Actions: BlockElement {
    private var elements: [AnyElement]
    
    public init(@ActionsBuilder _ content: () -> [AnyElement]) {
        self.elements = content()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("actions", forKey: .type)
        try container.encode(elements, forKey: .elements)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case elements
    }
}
