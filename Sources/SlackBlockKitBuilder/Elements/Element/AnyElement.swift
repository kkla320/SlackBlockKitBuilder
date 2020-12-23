//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.11.20.
//

import Foundation

public struct AnyElement: Element {
    private var element: Element
    
    public var type: ElementType {
        return element.type
    }
    
    init(_ element: Element) {
        self.element = element
    }
    
    public func encode(to encoder: Encoder) throws {
        try element.encode(to: encoder)
    }
}

extension Element {
    func eraseToAnyElement() -> AnyElement {
        return AnyElement(self)
    }
}
