//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Divider {
    public internal(set) var blockId: String?
    
    public init() {
        
    }
}

extension Divider: Block {
    public var type: ElementType {
        return .divider
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(blockId, forKey: .blockId)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case blockId = "block_id"
    }
}

extension Divider: Changeable {
    public func blockId(_ value: String) -> Divider {
        return self.changing { $0.blockId = value }
    }
}

extension ElementType {
    static var divider: ElementType {
        return ElementType(type: "divider")
    }
}
