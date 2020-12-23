//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 30.11.20.
//

import Foundation

public struct AnyTextObject: TextObject {
    private var textObject: TextObject
    
    public var type: ElementType {
        return self.textObject.type
    }
    
    init(_ textObject: TextObject) {
        self.textObject = textObject
    }
    
    public func encode(to encoder: Encoder) throws {
        try self.textObject.encode(to: encoder)
    }
}

extension TextObject {
    func eraseToAnyTextObject() -> AnyTextObject {
        return AnyTextObject(self)
    }
}
