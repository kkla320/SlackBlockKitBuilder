//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public protocol SectionElement: Element {
    var codingKeyForSection: Section.CodingKeys { get }
}

public struct AnySectionElement: SectionElement {
    public var codingKeyForSection: Section.CodingKeys {
        return sectionElement.codingKeyForSection
    }
    
    private var sectionElement: SectionElement
    
    init(_ sectionElement: SectionElement) {
        self.sectionElement = sectionElement
    }
    
    public func encode(to encoder: Encoder) throws {
        try sectionElement.encode(to: encoder)
    }
}

extension SectionElement {
    func eraseToAnySectionElement() -> AnySectionElement {
        return AnySectionElement(self)
    }
}
