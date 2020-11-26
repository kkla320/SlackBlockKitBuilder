//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

public struct Button: Element {
    private var url: String
    private var element: AnyElement
    
    public init(url: String, @ButtonBuilder _ content: () -> AnyElement) {
        self.url = url
        self.element = content()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode("button", forKey: .type)
        try container.encode(element, forKey: .text)
        try container.encode(url, forKey: .url)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case text
        case url
    }
}

