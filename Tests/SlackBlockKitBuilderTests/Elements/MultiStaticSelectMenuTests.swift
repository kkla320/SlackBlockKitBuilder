//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import XCTest
import SlackBlockKitBuilder

final class MultiStaticSelectMenuTests: XCTestCase {
    func testMultiStaticSelectMenu() {
        let multiSelectMenu = MultiStaticSelectMenu(actionId: "text1234") {
            PlainText(text: "Select items")
        } options: {
            Option(value: "value-0") {
                PlainText(text: "this is plain_text text")
            }
            Option(value: "value-1") {
                PlainText(text: "this is plain_text text")
            }
            Option(value: "value-2") {
                PlainText(text: "this is plain_text text")
            }
        }

        
        XCTAssertEncodedStructure(encodable: multiSelectMenu, structure: [
            "type": "multi_static_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select items"
            ],
            "options": [
                [
                    "text": [
                        "type": "plain_text",
                        "text": "this is plain_text text"
                    ],
                    "value": "value-0"
                ],
                [
                    "text": [
                        "type": "plain_text",
                        "text": "this is plain_text text"
                    ],
                    "value": "value-1"
                ],
                [
                    "text": [
                        "type": "plain_text",
                        "text": "this is plain_text text"
                    ],
                    "value": "value-2"
                ]
            ]
        ])
    }

    static var allTests = [
        ("testMultiStaticSelectMenu", testMultiStaticSelectMenu)
    ]
}
