//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Context: BlockElement {
    private var elements: [ContextElement]
    
    public var type: ElementType {
        return .context
    }
    
    public init(@ElementBuilder<ContextElement> _ content: () -> [ContextElement]) {
        self.elements = content()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(elements.map({ $0.eraseToAnyEncodable() }), forKey: .elements)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case elements
    }
}

extension ElementType {
    static var context: ElementType {
        return ElementType(type: "context")
    }
}
