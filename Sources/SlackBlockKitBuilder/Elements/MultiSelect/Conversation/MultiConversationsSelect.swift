//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.12.20.
//

import Foundation

public struct MultiConversationsSelect {
    private var placeholder: PlainText
    private var actionId: String
    var initialConversations: [String]?
    var defaultToCurrentConversation: Bool?
    var maxSelectedItems: Int?
    var filter: ConversationFilter?
    
    public init(actionId: String, placeholder: () -> PlainText) {
        self.placeholder = placeholder()
        self.actionId = actionId
    }
}

extension MultiConversationsSelect: Element {
    public var type: ElementType {
        return .multiConversationSelectMenu
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(placeholder, forKey: .placeholder)
        try container.encode(actionId, forKey: .actionId)
        try container.encodeIfPresent(initialConversations, forKey: .initialConversations)
        try container.encodeIfPresent(defaultToCurrentConversation, forKey: .defaultToCurrentConversation)
        try container.encodeIfPresent(maxSelectedItems, forKey: .maxSelectedItems)
        try container.encodeIfPresent(filter, forKey: .filter)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case placeholder
        case actionId = "action_id"
        case initialConversations = "initial_conversations"
        case defaultToCurrentConversation = "default_to_current_conversation"
        case maxSelectedItems = "max_selected_items"
        case filter
    }
}

extension MultiConversationsSelect: Changeable {
    public func initialConversations(_ value: [String]) -> MultiConversationsSelect {
        return self.changing { $0.initialConversations = value }
    }
    
    public func defaultToCurrentConversation(_ value: Bool) -> MultiConversationsSelect {
        return self.changing { $0.defaultToCurrentConversation = value }
    }
    
    public func maxSelectedItems(_ value: Int) -> MultiConversationsSelect {
        return self.changing { $0.maxSelectedItems = value }
    }
    
    public func filter(_ value: ConversationFilter) -> MultiConversationsSelect {
        return self.changing { $0.filter = value }
    }
}

extension ElementType {
    public static var multiConversationSelectMenu: ElementType {
        return ElementType(type: "multi_conversations_select")
    }
}
