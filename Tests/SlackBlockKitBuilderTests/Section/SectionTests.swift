//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class SectionsTests: XCTestCase {
    func testSections_ShouldEncodeCorrectly_PlainText() {
        let section = Section {
            PlainText(text: "Field", emoji: false)
        }
        let jsonResult = """
            {
                "type": "section",
                "text": {
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": false
                }
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(section)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testSections_ShouldEncodeCorrectly_TextFields() {
        let section = Section {
            TextFields {
                PlainText(text: "Field", emoji: true)
            }
        }
        let jsonResult = """
            {
                "type": "section",
                "fields": [
                    {
                        "type": "plain_text",
                        "text": "Field",
                        "emoji": true
                    }
                ]
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(section)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testSections_ShouldEncodeCorrectly_Accessories() {
        let section = Section {
            PlainText(text: "Field", emoji: true)
        } accessory: {
            Button(url: "http://github.com") {
                PlainText(text: "Github", emoji: false)
            }
        }
        let jsonResult = """
            {
                "type": "section",
                "text": {
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": true
                },
                "accessory": {
                    "type": "button",
                    "text": {
                        "type": "plain_text",
                        "text": "Github",
                        "emoji": false
                    },
                    "url": "http:\\/\\/github.com"
                }
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(section)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testSections_ShouldEncodeCorrectly_PlainText", testSections_ShouldEncodeCorrectly_PlainText),
        ("testSections_ShouldEncodeCorrectly_TextFields", testSections_ShouldEncodeCorrectly_TextFields)
    ]
}
