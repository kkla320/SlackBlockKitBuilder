//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

public struct ForEach<Input> {
    var elements: [Input]
    
    public init<Data>(data: Data, @ElementBuilder<Input> transform: (Data.Element) -> [Input]) where Data: Collection {
        self.elements = data
            .map { transform($0) }
            .flatMap { $0 }
    }
}

@_functionBuilder
public struct ElementBuilder<Input> {
    public static func buildFinalResult(_ parts: [Input]...) -> [Input] {
        return parts
            .flatMap { $0 }
    }
    
    public static func buildBlock(_ blocks: [Input]...) -> [Input] {
        return blocks.flatMap { $0 }
    }
    
    public static func buildExpression(_ block: Input) -> [Input] {
        return [block]
    }
    
    public static func buildExpression(_ forEach: ForEach<Input>) -> [Input] {
        return forEach.elements
    }
    
    public static func buildIf(_ blocks: [Input]?) -> [Input] {
        return blocks ?? []
    }
    
    public static func buildEither(first: [Input]) -> [Input] {
        return first
    }

    public static func buildEither(second: [Input]) -> [Input] {
        return second
    }
}
