//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.12.20.
//

import Foundation

public struct MultiConversationSelectMenu: Element {
    private var placeholder: PlainText
    private var actionId: String
    private var initialConversations: [String]?
    private var defaultToCurrentConversation: Bool?
    private var maxSelectedItems: Int?
    private var filter: ConversationFilter?
    
    public var type: ElementType {
        return .multiConversationSelectMenu
    }
    
    public init(actionId: String, initialConversations: [String]? = nil, defaultToCurrentConversation: Bool? = nil, maxSelectedItems: Int? = nil, filter: ConversationFilter? = nil, placeholder: () -> PlainText) {
        self.placeholder = placeholder()
        self.actionId = actionId
        self.initialConversations = initialConversations
        self.defaultToCurrentConversation = defaultToCurrentConversation
        self.maxSelectedItems = maxSelectedItems
        self.filter = filter
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

extension ElementType {
    public static var multiConversationSelectMenu: ElementType {
        return ElementType(type: "multi_conversations_select")
    }
}
