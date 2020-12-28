//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct TextFields {
    var elements: [TextObject]
    
    public init(@ElementBuilder<TextObject> _ content: () -> [TextObject]) {
        self.elements = content()
    }
}

extension ElementType {
    static var textFields: ElementType {
        return ElementType(type: "textFields")
    }
}
