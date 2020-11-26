//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

@_functionBuilder
public struct ContextBuilder {
    public static func buildBlock(_ elements: ContextElement...) -> [AnyElement] {
        return elements.map { $0.eraseToAnyElement() }
    }
}
