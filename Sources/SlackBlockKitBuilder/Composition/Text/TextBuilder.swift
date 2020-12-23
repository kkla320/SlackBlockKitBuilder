//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 29.11.20.
//

import Foundation

@_functionBuilder
public struct TextBuilder {
    public static func buildFinalResult(_ parts: [TextObject]...) -> [AnyTextObject] {
        return parts
            .flatMap { $0 }
            .map { $0.eraseToAnyTextObject() }
    }
    
    public static func buildBlock(_ blocks: [TextObject]...) -> [TextObject] {
        return blocks.flatMap { $0 }
    }
    
    public static func buildExpression(_ block: TextObject) -> [TextObject] {
        return [block]
    }
    
    public static func buildExpression<Element>(_ forEach: ForEach<Element>) -> [TextObject] where Element: TextObject {
        return forEach.elements
    }
    
    public static func buildIf(_ blocks: [TextObject]?) -> [TextObject] {
        return blocks ?? []
    }
    
    public static func buildEither(first: [TextObject]) -> [TextObject] {
        return first
    }

    public static func buildEither(second: [TextObject]) -> [TextObject] {
        return second
    }
}
