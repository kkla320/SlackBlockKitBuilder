//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

@_functionBuilder
public struct ActionsBuilder {
    public static func buildFinalResult(_ parts: [ActionsElement]...) -> [AnyElement] {
        return parts
            .flatMap { $0 }
            .map { $0.eraseToAnyElement() }
    }
    
    public static func buildBlock(_ blocks: [ActionsElement]...) -> [ActionsElement] {
        return blocks.flatMap { $0 }
    }
    
    public static func buildExpression(_ block: ActionsElement) -> [ActionsElement] {
        return [block]
    }
    
    public static func buildExpression<Element>(_ forEach: ForEach<Element>) -> [ActionsElement] where Element: ActionsElement {
        return forEach.elements
    }
    
    public static func buildIf(_ blocks: [ActionsElement]?) -> [ActionsElement] {
        return blocks ?? []
    }
    
    public static func buildEither(first: [ActionsElement]) -> [ActionsElement] {
        return first
    }

    public static func buildEither(second: [ActionsElement]) -> [ActionsElement] {
        return second
    }
}
