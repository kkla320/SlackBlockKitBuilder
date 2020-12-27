//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class ButtonTests: XCTestCase {
    func testButton() {
        let button = Button(actionId: "action_0") {
            PlainText(text: "Github", emoji: true)
        }
        
        XCTAssertEncodedStructure(encodable: button, structure: [
            "action_id": "action_0",
            "type": "button",
            "text": [
                "type": "plain_text",
                "text": "Github",
                "emoji": true
            ]
        ])
    }
    
    func testButton_OptionalFields() {
        let button = Button(actionId: "action_0") {
            PlainText(text: "Github", emoji: true)
        }
        .style(.danger)
        .value("value")
        .url(URL(string: "https://github.com")!)
        
        XCTAssertEncodedStructure(encodable: button, structure: [
            "action_id": "action_0",
            "url": "https://github.com",
            "value": "value",
            "style": "danger",
            "type": "button",
            "text": [
                "type": "plain_text",
                "text": "Github",
                "emoji": true
            ]
        ])
    }

    static var allTests = [
        ("testButton", testButton)
    ]
}
