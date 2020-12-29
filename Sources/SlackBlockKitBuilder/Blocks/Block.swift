//
//  File.swift
//
//
//  Created by Kevin Klaebe on 30.11.20.
//

import Foundation

/**
 A base protocol for all blocks. Blocks are a series of components that can be combined to create visually rich and compellingly interactive messages.
 */
public protocol Block: Encodable, WithType {
    var blockId: String? { get }
    
    func blockId(_ value: String) -> Self
}
