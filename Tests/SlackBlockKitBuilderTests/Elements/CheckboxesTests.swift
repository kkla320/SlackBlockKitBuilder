//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation
import XCTest
import SlackBlockKitBuilder

final class CheckboxesTests: XCTestCase {
    func testCheckboxes() {
        let checkboxes = Checkboxes(actionId: "action_0") {
            Option(value: "A1") {
                PlainText(text: "Checkbox 1")
            }
            Option(value: "A2") {
                PlainText(text: "Checkbox 2")
            }
            Option(value: "A3") {
                Markdown(text: "*Cat*", verbatim: false)
            }
        } initialOptions: {
            Option(value: "A1") {
                PlainText(text: "Checkbox 1")
            }
        }
        
        XCTAssertEncodedStructure(encodable: checkboxes, structure: [
            "action_id": "action_0",
            "type": "checkboxes",
            "initial_options": [
                [
                    "value": "A1",
                    "text": [
                        "type": "plain_text",
                        "text": "Checkbox 1"
                    ]
                ]
            ],
            "options": [
                [
                    "value": "A1",
                    "text": [
                        "type": "plain_text",
                        "text": "Checkbox 1"
                    ]
                ],
                [
                    "value": "A2",
                    "text": [
                        "type": "plain_text",
                        "text": "Checkbox 2"
                    ]
                ],
                [
                    "value": "A3",
                    "text": [
                        "type": "mrkdwn",
                        "text": "*Cat*",
                        "verbatim": false
                    ]
                ]
            ]
        ])
    }

    static var allTests = [
        ("testCheckboxes", testCheckboxes)
    ]
}
