//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Markdown {
    private var text: String
    var verbatim: Bool?
    
    public init(text: String) {
        self.text = text
    }
}

extension Markdown: TextObject {
    public var type: ElementType {
        return .markdown
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(text, forKey: .text)
        try container.encode(verbatim, forKey: .verbatim)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case text
        case verbatim
    }
}

extension Markdown: Changeable {
    public func verbatim(_ value: Bool) -> Markdown {
        return self.changing { $0.verbatim = value }
    }
}

extension ElementType {
    static var markdown: ElementType {
        return ElementType(type: "mrkdwn")
    }
}
