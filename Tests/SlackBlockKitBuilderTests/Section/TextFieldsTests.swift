//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class TextFieldsTests: XCTestCase {
    func testTextFields_ShouldEncodeCorrectly() {
        let textFields = TextFields {
            PlainText(text: "Field", emoji: false)
        }
        let jsonResult = """
            [
                {
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": false
                }
            ]
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testTextFields_ShouldEncodeCorrectly_MixedFields() {
        let textFields = TextFields {
            PlainText(text: "Field", emoji: false)
            Markdown(text: "*Cat*")
        }
        let jsonResult = """
            [
                {
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": false
                },
                {
                    "type": "mrkdwn",
                    "text": "*Cat*"
                }
            ]
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testTextFields_ShouldEncodeCorrectly", testTextFields_ShouldEncodeCorrectly)
    ]
}
