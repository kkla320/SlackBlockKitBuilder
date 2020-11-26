//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Header: BlockElement, Encodable {
    private var headerElement: AnyElement
    
    public init(@HeaderBuilder _ content: () -> AnyElement) {
        self.headerElement = content()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode("header", forKey: .type)
        try container.encode(headerElement, forKey: .text)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case text
    }
}
