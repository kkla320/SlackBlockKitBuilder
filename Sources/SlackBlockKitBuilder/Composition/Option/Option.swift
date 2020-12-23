//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation

public struct Option<T>: Element where T: TextObject {
    private var text: T
    private var value: String
    private var description: PlainText?
    private var url: URL?
    
    public var type: ElementType {
        return .none
    }
    
    public init(text: T, value: String) {
        self.text = text
        self.value = value
    }
    
    public init(value: String, text: () -> T) {
        self.value = value
        self.text = text()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(text, forKey: .text)
        try container.encode(value, forKey: .value)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(url, forKey: .url)
    }
    
    enum CodingKeys: CodingKey {
        case text
        case value
        case description
        case url
    }
}
