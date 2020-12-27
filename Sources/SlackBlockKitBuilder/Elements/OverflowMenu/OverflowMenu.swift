//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.12.20.
//

import Foundation

public struct OverflowMenu: Element {
    private var actionId: String
    private var options: [OverflowMenuOption]
    
    public var type: ElementType {
        return .overflowMenu
    }
    
    public init(actionId: String, @ElementBuilder<OverflowMenuOption> options: () -> [OverflowMenuOption]) {
        self.actionId = actionId
        self.options = options()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(actionId, forKey: .actionId)
        try container.encode(options.map({ $0.eraseToAnyEncodable() }), forKey: .options)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
    }
}

extension ElementType {
    public static var overflowMenu: ElementType {
        return ElementType(type: "overflow")
    }
}
