//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Header<Text>: BlockElement where Text: TextObject {
    private var text: Text
    
    public var type: ElementType {
        return .header
    }
    
    public init(_ text: () -> Text) {
        self.text = text()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(text, forKey: .text)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case text
    }
}

extension ElementType {
    static var header: ElementType {
        return ElementType(type: "header")
    }
}
