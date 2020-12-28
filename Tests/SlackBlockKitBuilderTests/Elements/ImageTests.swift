//
//  ImageTests.swift
//  SlackBlockKitBuilderTests
//
//  Created by Kevin Klaebe on 28.12.20.
//

import XCTest
import SlackBlockKitBuilder

class ImageTests: XCTestCase {
    func testImage() throws {
        let image = Image(imageUrl: URL(string: "http://placekitten.com/700/500")!, altText: "Multiple cute kittens")
        
        XCTAssertEncodedStructure(encodable: image, structure: [
            "type": "image",
            "image_url": "http://placekitten.com/700/500",
            "alt_text": "Multiple cute kittens"
        ])
    }
}
