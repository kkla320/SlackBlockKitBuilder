//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public protocol BlockElement: Element {
    
}

//@_functionBuilder
//public struct BlockBuilder {
//    public static func buildFinalResult(_ parts: [BlockElement]...) -> [BlockElement] {
//        return parts
//            .flatMap { $0 }
//    }
//    
//    public static func buildBlock(_ blocks: [BlockElement]...) -> [BlockElement] {
//        return blocks.flatMap { $0 }
//    }
//    
//    public static func buildExpression(_ block: BlockElement) -> [BlockElement] {
//        return [block]
//    }
//    
//    public static func buildExpression<Element>(_ forEach: ForEach<Element>) -> [BlockElement] where Element: BlockElement {
//        return forEach.elements
//    }
//    
//    public static func buildIf(_ blocks: [BlockElement]?) -> [BlockElement] {
//        return blocks ?? []
//    }
//    
//    public static func buildEither(first: [BlockElement]) -> [BlockElement] {
//        return first
//    }
//
//    public static func buildEither(second: [BlockElement]) -> [BlockElement] {
//        return second
//    }
//}

public struct Message: Encodable {
    private var blocks: [BlockElement]
    
    public init(@ElementBuilder<BlockElement> block: () -> [BlockElement]) {
        self.blocks = block()
    }
    
    public init(blocks: [BlockElement]) {
        self.blocks = blocks
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(blocks.map { $0.eraseToAnyEncodable() }, forKey: .blocks)
    }

    enum CodingKeys: CodingKey {
        case blocks
    }
}
