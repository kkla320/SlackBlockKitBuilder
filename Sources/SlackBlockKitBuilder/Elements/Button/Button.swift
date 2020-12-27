//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

public struct Button {
    private var actionId: String
    private var text: PlainText
    private var url: URL?
    private var value: String?
    private var style: ButtonStyle?
    
    public init(actionId: String, text: () -> PlainText) {
        self.actionId = actionId
        self.text = text()
    }
}

extension Button: Element {
    public var type: ElementType {
        return .button
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(text, forKey: .text)
        try container.encode(actionId, forKey: .actionId)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(value, forKey: .value)
        if style != .default {
            try container.encodeIfPresent(style, forKey: .style)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case text
        case actionId = "action_id"
        case url
        case value
        case style
    }
}

extension Button: Changeable {
    public func url(_ value: URL) -> Button {
        return self.changing { $0.url = value }
    }
    
    public func value(_ value: String) -> Button {
        return self.changing { $0.value = value }
    }
    
    public func style(_ value: ButtonStyle) -> Button {
        return self.changing { $0.style = value }
    }
}

extension ElementType {
    static var button: ElementType {
        return ElementType(type: "button")
    }
}
