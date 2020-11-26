//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct TextFields: SectionElement, Encodable {
    public var codingKeyForSection: Section.CodingKeys {
        return .fields
    }
    
    private var elements: [AnyElement]
    
    public init(@TextFieldsBuilder _ content: () -> [AnyElement]) {
        self.elements = content()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(elements)
    }
}
