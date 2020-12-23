//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation

public struct MultiStaticSelectMenu: Element {
    private var placeholder: PlainText
    private var actionId: String
    private var options: [MultiStaticSelectMenuOption]?
    private var optionGroups: [MultiStaticSelectMenuOptionGroup]?
    private var initialOptions: [MultiStaticSelectMenuOption]?
    private var maxSelectedItems: Int?
    
    public var type: ElementType {
        return .multiStaticSelectMenu
    }
    
    public init(actionId: String, placeholder: () -> PlainText, @MultiStaticSelectMenuOptionBuilder options: () -> [MultiStaticSelectMenuOption]) {
        self.actionId = actionId
        self.placeholder = placeholder()
        self.options = options()
        self.optionGroups = nil
    }
    
    public init(actionId: String, maxSelectedItems: Int?, placeholder: () -> PlainText, @MultiStaticSelectMenuOptionBuilder options: () -> [MultiStaticSelectMenuOption], @MultiStaticSelectMenuOptionBuilder initialOptions: () -> [MultiStaticSelectMenuOption]) {
        self.actionId = actionId
        self.placeholder = placeholder()
        self.options = options()
        self.initialOptions = initialOptions()
        self.optionGroups = nil
        self.maxSelectedItems = maxSelectedItems
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(actionId, forKey: .actionId)
        try container.encode(placeholder, forKey: .placeholder)
        try container.encodeIfPresent(maxSelectedItems, forKey: .maxSelectedItems)
        try container.encodeIfPresent(initialOptions?.map({ $0.eraseToAnyEncodable() }), forKey: .initialOptions)
        if let options = self.options {
            try container.encode(options.map({ $0.eraseToAnyEncodable() }), forKey: .options)
        }
        else if let groups = self.optionGroups {
            try container.encode(groups.map({ $0.eraseToAnyEncodable() }), forKey: .optionGroups)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case placeholder
        case actionId = "action_id"
        case options
        case optionGroups = "option_groups"
        case initialOptions = "initial_options"
        case maxSelectedItems = "max_selected_items"
    }
}

extension ElementType {
    static var multiStaticSelectMenu: ElementType {
        return ElementType(type: "multi_static_select")
    }
}
