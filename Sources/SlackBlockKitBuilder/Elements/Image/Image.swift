//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.11.20.
//

import Foundation

public struct Image {
    private var imageUrl: URL
    private var altText: String
    
    public init(imageUrl: URL, altText: String) {
        self.imageUrl = imageUrl
        self.altText = altText
    }
}

extension Image: Element {
    public var type: ElementType {
        return .image
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(imageUrl.absoluteString, forKey: .imageUrl)
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
