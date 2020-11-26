//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Markdown: Element {
    var text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode("mrkdwn", forKey: .type)
        try container.encode(text, forKey: .text)
    }
    
    enum CodingKeys: CodingKey {
        case type
        case text
    }
}
