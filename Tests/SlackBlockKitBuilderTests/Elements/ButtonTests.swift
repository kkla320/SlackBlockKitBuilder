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
        let button = Button(actionId: "action_0", url: "http://github.com", value: nil) {
            PlainText(text: "Github", emoji: true)
        }
        
        XCTAssertEncodedStructure(encodable: button, structure: [
            "action_id": "action_0",
            "url": "http://github.com",
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
