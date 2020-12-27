//
//  File.swift
//
//
//  Created by Kevin Klaebe on 30.11.20.
//

import Foundation

public protocol BlockElement1: Encodable, WithType {
    
}

public struct AnyBlockElement1: BlockElement1 {
    private var element: BlockElement1
    
    public var type: ElementType {
        return element.type
    }
    
    init(_ element: BlockElement1) {
        self.element = element
    }
    
    public func encode(to encoder: Encoder) throws {
        try self.element.encode(to: encoder)
    }
}

extension BlockElement1 {
    func eraseToAnyBlockElement1() -> AnyBlockElement1 {
        return AnyBlockElement1(self)
    }
}
