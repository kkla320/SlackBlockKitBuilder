//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder
import DictionaryCoding

final class ActionsTests: XCTestCase {
    func testActions() {
        let actions = Actions {
            Button(actionId: "action_0") {
                PlainText(text: "Test")
                    .emoji(true)
            }
        }
        
        XCTAssertEncodedStructure(encodable: actions, structure: [
            "type": "actions",
            "elements": [
                [
                    "type": "button",
                    "action_id": "action_0",
                    "text": [
                        "type": "plain_text",
                        "text": "Test",
                        "emoji": true
                    ]
                ]
            ]
        ])
    }

    static var allTests = [
        ("testActions", testActions)
    ]
}
