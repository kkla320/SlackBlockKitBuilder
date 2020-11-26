//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Section: BlockElement, Encodable {
    private var element: AnySectionElement
    private var accessories: [AnyElement]
    
    public init(@SectionBuilder _ content: () -> AnySectionElement) {
        self.element = content()
        self.accessories = []
    }
    
    public init(@SectionBuilder _ content: () -> AnySectionElement, @AccessoryBuilder accessories: () -> [AnyElement]) {
        self.element = content()
        self.accessories = accessories()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode("section", forKey: .type)
        try container.encode(element, forKey: element.codingKeyForSection)
        if accessories.count > 0 {
            try container.encode(accessories, forKey: .accessory)
        }
    }
    
    public enum CodingKeys: CodingKey {
        case type
        case text
        case fields
        case accessory
    }
}
