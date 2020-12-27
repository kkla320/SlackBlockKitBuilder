//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class SectionsTests: XCTestCase {
    func testSections() {
        let section = Section {
            PlainText(text: "Field", emoji: false)
        }
        
        XCTAssertEncodedStructure(encodable: section, structure: [
            "type": "section",
            "text": [
                "type": "plain_text",
                "text": "Field",
                "emoji": false
            ]
        ])
    }
    
    func testSections_TextFields() {
        let section = Section {
            TextFields {
                PlainText(text: "Field", emoji: true)
            }
        }
        
        XCTAssertEncodedStructure(encodable: section, structure: [
            "type": "section",
            "fields": [
                [
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": true
                ]
            ]
        ])
    }
    
//    func testSections_Accessories() {
//        let section = Section {
//            PlainText(text: "Field", emoji: true)
//        } accessory: {
//            Button(actionId: "action_0", url: "http://github.com", value: nil) {
//                PlainText(text: "Github", emoji: false)
//            }
//        }
//
//        XCTAssertEncodedStructure(encodable: section, structure: [
//            "type": "section",
//            "text": [
//                "type": "plain_text",
//                "text": "Field",
//                "emoji": true
//            ],
//            "accessory": [
//                "url": "http://github.com",
//                "type": "button",
//                "action_id": "action_0",
//                "text": [
//                    "type": "plain_text",
//                    "text": "Github",
//                    "emoji": false
//                ]
//            ]
//        ])
//    }

    static var allTests = [
        ("testSections", testSections),
//        ("testSections_Accessories", testSections_Accessories),
//        ("testSections_ShouldEncodeCorrectly_TextFields", testSections_ShouldEncodeCorrectly_TextFields)
    ]
}
