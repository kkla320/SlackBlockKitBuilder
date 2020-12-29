//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

/**
 A section is one of the most flexible blocks available - it can be used as a simple text block, in combination with text fields, or side-by-side with any of the available block elements.
 */
public struct Section {
    public internal(set) var blockId: String?
    private var text: TextObject?
    private var fields: TextFields?
    var accessory: Element?
    
    public init(_ text: () -> TextObject) {
        self.text = text()
    }
    
    public init(fields: () -> TextFields) {
        self.fields = fields()
    }
}

extension Section: Block {
    public var type: ElementType {
        return .section
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        if let text = text {
            try container.encode(text.eraseToAnyEncodable(), forKey: .text)
        }
        else if let textFields = fields?.elements {
            try container.encode(textFields.map({ $0.eraseToAnyEncodable() }), forKey: .fields)
        }
        try container.encodeIfPresent(accessory?.eraseToAnyEncodable(), forKey: .accessory)
        try container.encodeIfPresent(blockId, forKey: .blockId)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case text
        case fields
        case accessory
        case blockId = "block_id"
    }
}

extension Section: Changeable {
    public func accessory<T>(_ value: () -> T) -> Section where T: Element {
        return self.changing { $0.accessory = value() }
    }
    
    public func blockId(_ value: String) -> Section {
        return self.changing { $0.blockId = value }
    }
}

extension ElementType {
    static var section: ElementType {
        return ElementType(type: "section")
    }
}
