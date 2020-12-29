//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

/**
 A block that is used to hold interactive elements.
 */
public struct Actions {
    public internal(set) var blockId: String?
    private var elements: [Element]

    public init(@ElementBuilder<Element> _ content: () -> [Element]) {
        self.elements = content()
    }
}

extension Actions: Block {
    public var type: ElementType {
        return .actions
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(elements.map({ $0.eraseToAnyEncodable() }), forKey: .elements)
        try container.encodeIfPresent(blockId, forKey: .blockId)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case elements
        case blockId = "block_id"
    }
}

extension Actions: Changeable {
    public func blockId(_ value: String) -> Actions {
        return self.changing { $0.blockId = value }
    }
}

extension ElementType {
    static var actions: ElementType {
        return ElementType(type: "actions")
    }
}
