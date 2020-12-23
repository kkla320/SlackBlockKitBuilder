//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Section: BlockElement {
    private var text: AnyTextObject?
    private var fields: TextFields?
    private var accessory: AnyBlockElement1?
    
    public var type: ElementType {
        return .section
    }
    
    public init(_ text: () -> TextObject) {
        self.text = text().eraseToAnyTextObject()
        self.accessory = nil
    }
    
    public init(fields: () -> TextFields) {
        self.text = nil
        self.fields = fields()
    }
    
    public init(_ text: () -> TextObject, accessory: () -> BlockElement1) {
        self.text = text().eraseToAnyTextObject()
        self.accessory = accessory().eraseToAnyBlockElement1()
    }
    
    public init(_ fields: () -> TextFields, accessory: () -> BlockElement1) {
        self.fields = fields()
        self.accessory = accessory().eraseToAnyBlockElement1()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        if text != nil {
            try container.encode(text, forKey: .text)
        }
        else {
            try container.encode(fields?.elements, forKey: .fields)
        }
        try container.encodeIfPresent(accessory, forKey: .accessory)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case text
        case fields
        case accessory
    }
}

extension ElementType {
    static var section: ElementType {
        return ElementType(type: "section")
    }
}
