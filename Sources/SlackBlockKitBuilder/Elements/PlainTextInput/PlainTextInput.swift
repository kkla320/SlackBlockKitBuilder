//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.12.20.
//

import Foundation

public struct PlainTextInput {
    private var actionId: String
    
    var placeholder: PlainText?
    var initialValue: String?
    var multiline: Bool?
    var minLength: Int?
    var maxLength: Int?
    
    public init(actionId: String) {
        self.actionId = actionId
    }
}

extension PlainTextInput: Element {
    public var type: ElementType {
        .plainTextInput
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(actionId, forKey: .actionId)
        try container.encodeIfPresent(placeholder, forKey: .placeholder)
        try container.encodeIfPresent(initialValue, forKey: .initialValue)
        try container.encodeIfPresent(multiline, forKey: .multiline)
        try container.encodeIfPresent(minLength, forKey: .minLength)
        try container.encodeIfPresent(maxLength, forKey: .maxLength)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case placeholder
        case initialValue = "initial_value"
        case multiline
        case minLength = "min_length"
        case maxLength = "max_length"
    }
}

extension ElementType {
    public static var plainTextInput: ElementType {
        return ElementType(type: "plain_text_input")
    }
}

extension PlainTextInput: Changeable { }

extension PlainTextInput {
    public func placeholder(_ placeholder:() -> PlainText) -> PlainTextInput {
        return self.changing { $0.placeholder = placeholder() }
    }
    
    public func initialValue(_ value: String) -> PlainTextInput {
        return self.changing { $0.initialValue = value }
    }
    
    public func multiline(_ value: Bool) -> PlainTextInput {
        return self.changing { $0.multiline = value }
    }
    
    public func minLength(_ value: Int) -> PlainTextInput {
        return self.changing { $0.minLength = value }
    }
    
    public func maxLength(_ value: Int) -> PlainTextInput {
        return self.changing { $0.maxLength = value }
    }
}
