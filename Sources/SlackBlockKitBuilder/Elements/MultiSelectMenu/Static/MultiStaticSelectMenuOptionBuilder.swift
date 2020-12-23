//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation

@_functionBuilder
public struct MultiStaticSelectMenuOptionBuilder {
    public static func buildFinalResult(_ parts: [MultiStaticSelectMenuOption]...) -> [MultiStaticSelectMenuOption] {
        return parts
            .flatMap { $0 }
    }
    
    public static func buildBlock(_ blocks: [MultiStaticSelectMenuOption]...) -> [MultiStaticSelectMenuOption] {
        return blocks.flatMap { $0 }
    }
    
    public static func buildExpression(_ block: MultiStaticSelectMenuOption) -> [MultiStaticSelectMenuOption] {
        return [block]
    }
    
    public static func buildExpression<Element>(_ forEach: ForEach<Element>) -> [MultiStaticSelectMenuOption] where Element: MultiStaticSelectMenuOption {
        return forEach.elements
    }
    
    public static func buildIf(_ blocks: [MultiStaticSelectMenuOption]?) -> [MultiStaticSelectMenuOption] {
        return blocks ?? []
    }
    
    public static func buildEither(first: [MultiStaticSelectMenuOption]) -> [MultiStaticSelectMenuOption] {
        return first
    }

    public static func buildEither(second: [MultiStaticSelectMenuOption]) -> [MultiStaticSelectMenuOption] {
        return second
    }
}
