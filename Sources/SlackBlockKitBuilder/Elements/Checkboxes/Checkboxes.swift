//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 29.11.20.
//

import Foundation

public struct Checkboxes: Element {
    private var actionId: String
    private var options: [CheckboxOption]
    private var initialOptions: [CheckboxOption]
    
    public var type: ElementType {
        return .checkboxes
    }
    
    public init(actionId: String, @CheckboxesBuilder options: () -> [CheckboxOption], @CheckboxesBuilder initialOptions: () -> [CheckboxOption]) {
        self.actionId = actionId
        self.options = options()
        self.initialOptions = initialOptions()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(actionId, forKey: .actionId)
        try container.encode(options.map({ $0.eraseToAnyEncodable() }), forKey: .options)
        try container.encode(initialOptions.map({ $0.eraseToAnyEncodable() }), forKey: .initialOptions)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
        case initialOptions = "initial_options"
    }
}

extension Option: CheckboxOption where T: TextObject {
    
}

extension ElementType {
    public static var checkboxes: ElementType {
        return ElementType(type: "checkboxes")
    }
}
