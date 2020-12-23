//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct TextFields {
    var elements: [AnyTextObject]
    
    public init(@TextBuilder _ content: () -> [AnyTextObject]) {
        self.elements = content()
    }
}

extension ElementType {
    static var textFields: ElementType {
        return ElementType(type: "textFields")
    }
}
