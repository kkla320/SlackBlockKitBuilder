//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation

public struct MultiStaticSelect {
    private var placeholder: PlainText
    private var actionId: String
    private var options: [MultiStaticSelectOption]?
    private var optionGroups: [MultiStaticSelectOptionGroup]?
    var initialOptions: [MultiStaticSelectOption]?
    var maxSelectedItems: Int?
    
    public init(actionId: String, placeholder: () -> PlainText, @ElementBuilder<MultiStaticSelectOption> options: () -> [MultiStaticSelectOption]) {
        self.actionId = actionId
        self.placeholder = placeholder()
        self.options = options()
    }
    
    public init(actionId: String, placeholder: () -> PlainText, @ElementBuilder<MultiStaticSelectOptionGroup> optionGroups: () -> [MultiStaticSelectOptionGroup]) {
        self.actionId = actionId
        self.placeholder = placeholder()
        self.optionGroups = optionGroups()
    }
}

extension MultiStaticSelect: Element {
    public var type: ElementType {
        return .multiStaticSelect
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

extension MultiStaticSelect: Changeable {
    public func initialOptions(@ElementBuilder<MultiStaticSelectOption> _ value: () -> [MultiStaticSelectOption]) -> MultiStaticSelect {
        return self.changing { $0.initialOptions = value() }
    }
    
    public func maxSelectedItems(_ value: Int) -> MultiStaticSelect {
        return self.changing { $0.maxSelectedItems = value }
    }
}

extension ElementType {
    public static var multiStaticSelect: ElementType {
        return ElementType(type: "multi_static_select")
    }
}
