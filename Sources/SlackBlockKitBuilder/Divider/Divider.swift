//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

public struct Divider: BlockElement, Encodable {
    public init() {
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("divider", forKey: .type)
    }
    
    enum CodingKeys: CodingKey {
        case type
    }
}
