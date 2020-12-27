//
//  File.swift
//
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class PlainTextInputTests: XCTestCase {
    func testPlainTextInput() {
        let plainTextInput = PlainTextInput(actionId: "text1234")
        
        XCTAssertEncodedStructure(encodable: plainTextInput, structure: [
            "type": "plain_text_input",
            "action_id": "text1234"
        ])
    }
    
    func testPlainTextInput_OptionalFields() {
        let plainTextInput = PlainTextInput(actionId: "text1234")
            .placeholder {
                PlainText(text: "Text")
            }
            .initialValue("Text")
            .multiline(true)
            .minLength(0)
            .maxLength(1000)
        
        XCTAssertEncodedStructure(encodable: plainTextInput, structure: [
            "type": "plain_text_input",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Text"
            ],
            "initial_value": "Text",
            "multiline": true,
            "min_length": 0,
            "max_length": 1000
        ])
    }

    static var allTests = [
        ("testPlainTextInput", testPlainTextInput),
        ("testPlainTextInput_OptionalFields", testPlainTextInput_OptionalFields)
    ]
}
