//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.11.20.
//

import Foundation

public struct Image: Element {
    private var imageUrl: String
    private var altText: String
    
    public var type: ElementType {
        return .image
    }
    
    public init(imageUrl: String, altText: String) {
        self.imageUrl = imageUrl
        self.altText = altText
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(imageUrl, forKey: .imageUrl)
        try container.encode(altText, forKey: .altText)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case imageUrl = "image_url"
        case altText = "alt_text"
    }
}

extension ElementType {
    static var image: ElementType {
        return ElementType(type: "image")
    }
}
