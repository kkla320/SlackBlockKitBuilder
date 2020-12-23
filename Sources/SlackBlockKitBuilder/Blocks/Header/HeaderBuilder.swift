//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

@_functionBuilder
public struct HeaderBuilder {
    public static func buildBlock(_ header: HeaderElement) -> AnyElement {
        return header.eraseToAnyElement()
    }
}
