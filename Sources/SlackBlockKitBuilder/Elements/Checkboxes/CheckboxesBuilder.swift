//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 29.11.20.
//

import Foundation

@_functionBuilder
public struct CheckboxesBuilder {
    public static func buildFinalResult(_ parts: [CheckboxOption]...) -> [CheckboxOption] {
        return parts
            .flatMap { $0 }
    }
    
    public static func buildBlock(_ blocks: [CheckboxOption]...) -> [CheckboxOption] {
        return blocks.flatMap { $0 }
    }
    
    public static func buildExpression(_ block: CheckboxOption) -> [CheckboxOption] {
        return [block]
    }
    
    public static func buildExpression<Element>(_ forEach: ForEach<Element>) -> [CheckboxOption] where Element: CheckboxOption {
        return forEach.elements
    }
    
    public static func buildIf(_ blocks: [CheckboxOption]?) -> [CheckboxOption] {
        return blocks ?? []
    }
    
    public static func buildEither(first: [CheckboxOption]) -> [CheckboxOption] {
        return first
    }

    public static func buildEither(second: [CheckboxOption]) -> [CheckboxOption] {
        return second
    }
}
