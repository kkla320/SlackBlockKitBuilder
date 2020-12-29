//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

/**
 Displays message context, which can include both images and text.
 */
public struct Context {
    public internal(set) var blockId: String?
    private var elements: [ContextElement]
    
    public init(@ElementBuilder<ContextElement> _ content: () -> [ContextElement]) {
        self.elements = content()
    }
}

extension Context: Block {
    public var type: ElementType {
        return .context
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

extension Context: Changeable {
    public func blockId(_ value: String) -> Context {
        return self.changing { $0.blockId = value }
    }
}

extension ElementType {
    static var context: ElementType {
        return ElementType(type: "context")
    }
}
