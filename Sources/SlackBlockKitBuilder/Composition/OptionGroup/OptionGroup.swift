//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation

public struct OptionGroup<T>: Element where T: TextObject {
    private var label: PlainText
    private var options: [Option<T>]
    
    public var type: ElementType {
        return .none
    }
    
    public init(label: () -> PlainText, @ElementBuilder<Option<T>> options: () -> [Option<T>]) {
        self.label = label()
        self.options = options()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(label, forKey: .label)
        try container.encode(options, forKey: .options)
    }
    
    enum CodingKeys: CodingKey {
        case label
        case options
    }
}
