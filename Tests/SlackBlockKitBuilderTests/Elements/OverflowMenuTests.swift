//
//  File.swift
//
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation
import XCTest
import SlackBlockKitBuilder

final class OverflowTests: XCTestCase {
    func testOverflowMenu() {
        let overflowMenu = Overflow(actionId: "text1234") {
            Option(value: "value-0") {
                PlainText(text: "Text")
            }
            Option(value: "value-1") {
                PlainText(text: "Text")
            }
        }
        
        XCTAssertEncodedStructure(encodable: overflowMenu, structure: [
            "action_id": "text1234",
            "type": "overflow",
            "options": [
                [
                    "value": "value-0",
                    "text": [
                        "type": "plain_text",
                        "text": "Text"
                    ]
                ],
                [
                    "value": "value-1",
                    "text": [
                        "type": "plain_text",
                        "text": "Text"
                    ]
                ]
            ]
        ])
    }

    static var allTests = [
        ("testOverflowMenu", testOverflowMenu)
    ]
}
