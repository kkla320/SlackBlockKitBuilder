//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class ContextTests: XCTestCase {
    func testContext() {
        let context = Context {
            PlainText(text: "Field")
                .emoji(false)
        }
        
        XCTAssertEncodedStructure(encodable: context, structure: [
            "type": "context",
            "elements": [
                [
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": false
                ]
            ]
        ])
    }
    
    func testContext_MixedFields() {
        let context = Context {
            PlainText(text: "Field")
                .emoji(true)
            Markdown(text: "*Cat*")
                    .verbatim(false)
        }
        
        XCTAssertEncodedStructure(encodable: context, structure: [
            "type": "context",
            "elements": [
                [
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": true
                ],
                [
                    "type": "mrkdwn",
                    "text": "*Cat*",
                    "verbatim": false
                ]
            ]
        ])
    }

    static var allTests = [
        ("testContext", testContext),
        ("testContext_MixedFields", testContext_MixedFields)
    ]
}
