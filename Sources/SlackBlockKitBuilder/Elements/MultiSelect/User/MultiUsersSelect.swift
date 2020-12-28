//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation

public struct MultiUsersSelect {
    private var placeholder: PlainText
    private var actionId: String
    var initialUsers: [String]?
    var maxSelectedItems: Int?
    
    public init(actionId: String, placeholder: () -> PlainText) {
        self.actionId = actionId
        self.placeholder = placeholder()
    }
}

extension MultiUsersSelect: Element {
    public var type: ElementType {
        return .multiUsersSelectMenu
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

extension MultiUsersSelect: Changeable {
    public func initialUsers(_ value: [String]) -> MultiUsersSelect {
        return self.changing { $0.initialUsers = value }
    }
    
    public func maxSelectedItems(_ value: Int) -> MultiUsersSelect {
        return self.changing { $0.maxSelectedItems = value }
    }
}

extension ElementType {
    public static var multiUsersSelectMenu: ElementType {
        return ElementType(type: "multi_users_select")
    }
}
