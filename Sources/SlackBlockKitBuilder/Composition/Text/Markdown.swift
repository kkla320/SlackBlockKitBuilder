//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Markdown: TextObject {
    private var text: String
    private var verbatim: Bool
    
    public var type: ElementType {
        return .markdown
    }
    
    public init(text: String, verbatim: Bool) {
        self.text = text
        self.verbatim = verbatim
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

extension ElementType {
    static var markdown: ElementType {
        return ElementType(type: "mrkdwn")
    }
}
