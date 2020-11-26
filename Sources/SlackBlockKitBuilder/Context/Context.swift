//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Context: BlockElement, Encodable {
    private var elements: [AnyElement]
    
    public init(@ContextBuilder _ content: () -> [AnyElement]) {
        self.elements = content()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("context", forKey: .type)
        try container.encode(elements, forKey: .elements)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case elements
    }
}
