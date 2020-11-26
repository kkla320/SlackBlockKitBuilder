//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

protocol BlockElement: Element {
    
}

@_functionBuilder
struct BlockBuilder {
  static func buildBlock(_ blocks: BlockElement...) -> [AnyElement] {
    return blocks.map { $0.eraseToAnyElement() }
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
