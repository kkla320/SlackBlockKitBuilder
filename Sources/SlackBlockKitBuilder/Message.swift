//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

/**
 A container for a list of blocks.
 */
public struct Message: Encodable {
    private var blocks: [Block]
    
    public init(@ElementBuilder<Block> block: () -> [Block]) {
        self.blocks = block()
    }
    
    public init(blocks: [Block]) {
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
