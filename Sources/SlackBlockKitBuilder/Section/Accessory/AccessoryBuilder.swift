//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import Foundation

@_functionBuilder
public struct AccessoryBuilder {
    public static func buildBlock(_ element: AccessoryElement) -> AnyElement {
        return element.eraseToAnyElement()
    }
}
