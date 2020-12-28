//
//  File.swift
//
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class RadioButtonGroupTests: XCTestCase {
    func testRadioButtonGroup() {
        let radioButtonGroup = RadioButtons(actionId: "text1234") {
            Option(value: "value-0") {
                PlainText(text: "Text")
            }
            Option(value: "value-1") {
                Markdown(text: "*Markdown*")
                    .verbatim(false)
            }
        }
        
        XCTAssertEncodedStructure(encodable: radioButtonGroup, structure: [
            "action_id": "text1234",
            "type": "radio_buttons",
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
                        "type": "mrkdwn",
                        "text": "*Markdown*",
                        "verbatim": false
                    ]
                ]
            ]
        ])
    }
    
    func testRadioButtonGroup_OptionalFields() {
        let radioButtonGroup = RadioButtons(actionId: "text1234") {
            Option(value: "value-0") {
                PlainText(text: "Text")
            }
            Option(value: "value-1") {
                Markdown(text: "*Markdown*")
                    .verbatim(false)
            }
        }
        .initialOption {
            Option(value: "value-0") {
                PlainText(text: "Text")
            }
        }
        
        XCTAssertEncodedStructure(encodable: radioButtonGroup, structure: [
            "action_id": "text1234",
            "type": "radio_buttons",
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
                        "type": "mrkdwn",
                        "text": "*Markdown*",
                        "verbatim": false
                    ]
                ]
            ],
            "initial_option": [
                "value": "value-0",
                "text": [
                    "type": "plain_text",
                    "text": "Text"
                ]
            ]
        ])
    }

    static var allTests = [
        ("testRadioButtonGroup", testRadioButtonGroup)
    ]
}
