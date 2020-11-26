//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Section: BlockElement, Encodable {
    private var element: AnySectionElement
    private var accessory: AnyElement?
    
    public init(@SectionBuilder _ content: () -> AnySectionElement) {
        self.element = content()
        self.accessory = nil
    }
    
    public init(@SectionBuilder _ content: () -> AnySectionElement, @AccessoryBuilder accessory: () -> AnyElement) {
        self.element = content()
        self.accessory = accessory()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode("section", forKey: .type)
        try container.encode(element, forKey: element.codingKeyForSection)
        try container.encodeIfPresent(accessory, forKey: .accessory)
    }
    
    public enum CodingKeys: CodingKey {
        case type
        case text
        case fields
        case accessory
    }
}
