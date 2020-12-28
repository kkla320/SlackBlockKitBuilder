//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct PlainText {
    private var text: String
    var emoji: Bool?
    
    public init(text: String) {
        self.text = text
    }
}

extension PlainText: TextObject {
    public var type: ElementType {
        return .plainText
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

extension PlainText: Changeable {
    public func emoji(_ value: Bool) -> PlainText {
        return self.changing { $0.emoji = value }
    }
}

extension ElementType {
    public static var plainText: ElementType {
        return ElementType(type: "plain_text")
    }
}
