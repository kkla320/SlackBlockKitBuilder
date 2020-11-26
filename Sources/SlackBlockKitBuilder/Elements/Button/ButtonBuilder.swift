//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

@_functionBuilder
public struct ButtonBuilder {
    public static func buildBlock(_ element: ButtonElement) -> AnyElement {
        return element.eraseToAnyElement()
    }
}
