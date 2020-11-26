//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

@_functionBuilder
public struct TextFieldsBuilder {
    public static func buildFinalResult(_ parts: [TextFieldsElement]...) -> [AnyElement] {
        return parts
            .flatMap { $0 }
            .map { $0.eraseToAnyElement() }
    }
    
    public static func buildBlock(_ blocks: [TextFieldsElement]...) -> [TextFieldsElement] {
        return blocks.flatMap { $0 }
    }
    
    public static func buildExpression(_ block: TextFieldsElement) -> [TextFieldsElement] {
        return [block]
    }
    
    public static func buildExpression<Element>(_ forEach: ForEach<Element>) -> [TextFieldsElement] where Element: TextFieldsElement {
        return forEach.elements
    }
    
    public static func buildIf(_ blocks: [TextFieldsElement]?) -> [TextFieldsElement] {
        return blocks ?? []
    }
    
    public static func buildEither(first: [TextFieldsElement]) -> [TextFieldsElement] {
        return first
    }

    public static func buildEither(second: [TextFieldsElement]) -> [TextFieldsElement] {
        return second
    }
}
