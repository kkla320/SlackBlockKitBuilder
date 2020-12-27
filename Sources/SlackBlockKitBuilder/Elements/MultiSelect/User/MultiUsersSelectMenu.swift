//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation

public struct MultiUsersSelectMenu: Element {
    private var placeholder: PlainText
    private var actionId: String
    private var initialUsers: [String]?
    private var maxSelectedItems: Int?
    
    public var type: ElementType {
        return .multiUsersSelectMenu
    }
    
    public init(actionId: String, initialUsers: [String]? = nil, maxSelectedItems: Int? = nil, placeholder: () -> PlainText) {
        self.actionId = actionId
        self.initialUsers = initialUsers
        self.maxSelectedItems = maxSelectedItems
        self.placeholder = placeholder()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(actionId, forKey: .actionId)
        try container.encode(placeholder, forKey: .placeholder)
        try container.encodeIfPresent(initialUsers, forKey: .initialUsers)
        try container.encodeIfPresent(maxSelectedItems, forKey: .maxSelectedItems)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case placeholder
        case actionId = "action_id"
        case initialUsers = "initial_users"
        case maxSelectedItems = "max_selected_items"
    }
}

extension ElementType {
    public static var multiUsersSelectMenu: ElementType {
        return ElementType(type: "multi_users_select")
    }
}
