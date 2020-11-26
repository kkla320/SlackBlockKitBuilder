//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 25.11.20.
//

import Foundation

extension PlainText: SectionElement {
    public var codingKeyForSection: Section.CodingKeys {
        return .text
    }
}
