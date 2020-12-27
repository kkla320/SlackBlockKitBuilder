//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.12.20.
//

import Foundation

public struct MultiChannelsSelect {
    private var actionId: String
    private var placeholder: PlainText
    var initialChannels: [String]?
    var maxSelectedItems: Int?
    
    public init(actionId: String, placeholder: () -> PlainText) {
        self.actionId = actionId
        self.placeholder = placeholder()
    }
}

extension MultiChannelsSelect: Element {
    public var type: ElementType {
        return .multiChannelsSelectMenu
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(actionId, forKey: .actionId)
        try container.encode(placeholder, forKey: .placeholder)
        try container.encodeIfPresent(initialChannels, forKey: .initialChannels)
        try container.encodeIfPresent(maxSelectedItems, forKey: .maxSelectedItems)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case placeholder
        case initialChannels = "initial_channels"
        case maxSelectedItems = "max_selected_items"
    }
}

extension MultiChannelsSelect: Changeable {
    public func initialChannels(_ value: [String]) -> MultiChannelsSelect {
        return self.changing { $0.initialChannels = value }
    }
    
    public func maxSelectedItems(_ value: Int) -> MultiChannelsSelect {
        return self.changing { $0.maxSelectedItems = value }
    }
}

extension ElementType {
    public static var multiChannelsSelectMenu: ElementType {
        return ElementType(type: "multi_channels_select")
    }
}
