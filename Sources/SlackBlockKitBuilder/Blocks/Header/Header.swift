//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Header {
    public internal(set) var blockId: String?
    private var text: PlainText
    
    public init(_ text: () -> PlainText) {
        self.text = text()
    }
}

extension Header: Block {
    public var type: ElementType {
        return .header
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(text, forKey: .text)
        try container.encodeIfPresent(blockId, forKey: .blockId)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case text
        case blockId = "block_id"
    }
}

extension Header: Changeable {
    public func blockId(_ value: String) -> Header {
        return self.changing { $0.blockId = value }
    }
}

extension ElementType {
    static var header: ElementType {
        return ElementType(type: "header")
    }
}
