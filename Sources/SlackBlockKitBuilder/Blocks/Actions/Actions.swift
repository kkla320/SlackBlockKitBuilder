//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

public struct Actions: BlockElement {
    private var elements: [Element]
    
    public var type: ElementType {
        return .actions
    }
    
    public init(@ActionsBuilder _ content: () -> [Element]) {
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
    static var actions: ElementType {
        return ElementType(type: "actions")
    }
}
