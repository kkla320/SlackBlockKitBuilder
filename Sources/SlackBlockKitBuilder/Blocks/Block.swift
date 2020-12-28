//
//  File.swift
//
//
//  Created by Kevin Klaebe on 30.11.20.
//

import Foundation

public protocol Block: Encodable, WithType {
    var blockId: String? { get }
    
    func blockId(_ value: String) -> Self
}
