//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.12.20.
//

import Foundation

public struct RadioButtons {
    private var actionId: String
    private var options: [RadioButtonOption]
    var initialOption: RadioButtonOption?
    
    public init(actionId: String, @ElementBuilder<RadioButtonOption> options: () -> [RadioButtonOption]) {
        self.actionId = actionId
        self.options = options()
    }
}

extension RadioButtons: Element {
    public var type: ElementType {
        return .radioButtonGroup
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(actionId, forKey: .actionId)
        try container.encode(options.map({ $0.eraseToAnyEncodable() }), forKey: .options)
        try container.encodeIfPresent(initialOption?.eraseToAnyEncodable(), forKey: .initialOptions)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
        case initialOptions = "initial_option"
    }
}

extension RadioButtons: Changeable {
    public func initialOption(_ value: () -> RadioButtonOption) -> RadioButtons {
        return self.changing { $0.initialOption = value() }
    }
}

extension ElementType {
    public static var radioButtonGroup: ElementType {
        return ElementType(type: "radio_buttons")
    }
}
