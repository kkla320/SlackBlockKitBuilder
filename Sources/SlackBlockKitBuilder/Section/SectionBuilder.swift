//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

@_functionBuilder
public struct SectionBuilder {
    public static func buildBlock(_ section: SectionElement) -> AnySectionElement {
        return section.eraseToAnySectionElement()
    }
}
