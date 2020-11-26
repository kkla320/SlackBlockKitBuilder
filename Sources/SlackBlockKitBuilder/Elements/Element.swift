//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

public protocol Element: Encodable {
    
}

public struct AnyElement: Element {
    private var element: Element
    
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
