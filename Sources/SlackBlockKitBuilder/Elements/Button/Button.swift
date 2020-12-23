//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

public struct Button: BlockElement1 {
    private var actionId: String
    private var url: String?
    private var value: String?
    private var style: ButtonStyle
    private var text: PlainText
    
    public var type: ElementType {
        return .button
    }
    
    public init(actionId: String, url: String?, value: String?, style: ButtonStyle = .default, _ text: () -> PlainText) {
        self.actionId = actionId
        self.url = url
        self.value = value
        self.style = style
        self.text = text()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(text, forKey: .text)
        try container.encode(actionId, forKey: .actionId)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(value, forKey: .value)
        if style != .default {
            try container.encode(style, forKey: .style)
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

public enum ButtonStyle: String, Encodable {
    case `default` = "default"
    case primary = "primary"
    case danger = "danger"
}

extension ElementType {
    static var button: ElementType {
        return ElementType(type: "button")
    }
}
