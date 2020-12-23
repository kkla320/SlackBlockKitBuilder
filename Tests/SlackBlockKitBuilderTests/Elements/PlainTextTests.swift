//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class PlainTextTests: XCTestCase {
    func testPlainText() {
        let plainText = PlainText(text: "Text", emoji: true)
        
        XCTAssertEncodedStructure(encodable: plainText, structure: [
            "type": "plain_text",
            "text": "Text",
            "emoji": true
        ])
    }
    
    func testPlainText_NoEmoji() {
        let plainText = PlainText(text: "Text")
        
        XCTAssertEncodedStructure(encodable: plainText, structure: [
            "type": "plain_text",
            "text": "Text"
        ])
    }

    static var allTests = [
        ("testPlainText", testPlainText),
        ("testPlainText_NoEmoji", testPlainText_NoEmoji)
    ]
}
