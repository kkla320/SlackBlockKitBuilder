//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public protocol BlockElement: Element {
    
}

@_functionBuilder
public struct BlockBuilder {
    public static func buildFinalResult(_ parts: [BlockElement]...) -> [AnyElement] {
        return parts
            .flatMap { $0 }
            .map { $0.eraseToAnyElement() }
    }
    
    public static func buildBlock(_ blocks: [BlockElement]...) -> [BlockElement] {
        return blocks.flatMap { $0 }
    }
    
    public static func buildExpression(_ block: BlockElement) -> [BlockElement] {
        return [block]
    }
    
    public static func buildExpression<Element>(_ forEach: ForEach<Element>) -> [BlockElement] where Element: BlockElement {
        return forEach.elements
    }
    
    public static func buildIf(_ blocks: [BlockElement]?) -> [BlockElement] {
        return blocks ?? []
    }
    
    public static func buildEither(first: [BlockElement]) -> [BlockElement] {
        return first
    }

    public static func buildEither(second: [BlockElement]) -> [BlockElement] {
        return second
    }
}

public struct Message: Encodable {
    private var blocks: [AnyElement]
    
    public init(@BlockBuilder block: () -> [AnyElement]) {
        self.blocks = block()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(blocks, forKey: .blocks)
    }

    enum CodingKeys: CodingKey {
        case blocks
    }
}
