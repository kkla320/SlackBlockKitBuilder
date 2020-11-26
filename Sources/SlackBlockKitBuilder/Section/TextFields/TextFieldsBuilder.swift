//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

@_functionBuilder
public struct TextFieldsBuilder {
    public static func buildBlock(_ fields: TextFieldsElement...) -> [AnyElement] {
        return fields.map { $0.eraseToAnyElement() }
    }
}
