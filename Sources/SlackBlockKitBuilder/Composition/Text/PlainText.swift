//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct PlainText: TextObject {
    private var text: String
    private var emoji: Bool?
    
    public var type: ElementType {
        return .plainText
    }
    
    public init(text: String, emoji: Bool? = nil) {
        self.text = text
        self.emoji = emoji
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(text, forKey: .text)
        try container.encodeIfPresent(emoji, forKey: .emoji)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case text
        case emoji
    }
}

extension ElementType {
    public static var plainText: ElementType {
        return ElementType(type: "plain_text")
    }
}
