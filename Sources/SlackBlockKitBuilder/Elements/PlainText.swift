//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct PlainText: Element {
    var text: String
    var emoji: Bool
    
    public init(text: String, emoji: Bool) {
        self.text = text
        self.emoji = emoji
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode("plain_text", forKey: .type)
        try container.encode(text, forKey: .text)
        try container.encode(emoji, forKey: .emoji)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case text
        case emoji
    }
}
