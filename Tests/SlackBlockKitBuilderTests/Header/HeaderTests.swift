//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class HeaderTests: XCTestCase {
    func testHeader() {
        let header = Header {
            PlainText(text: "Text")
                .emoji(false)
        }
        
        XCTAssertEncodedStructure(encodable: header, structure: [
            "type": "header",
            "text": [
                "type": "plain_text",
                "text": "Text",
                "emoji": false
            ]
        ])
    }

    static var allTests = [
        ("testHeader", testHeader),
    ]
}
