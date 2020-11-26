//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class ContextTests: XCTestCase {
    func testContext_ShouldEncodeCorrectly() {
        let context = Context {
            PlainText(text: "Field", emoji: false)
        }
        let jsonResult = """
            {
                "type": "context",
                "elements": [
                    {
                        "type": "plain_text",
                        "text": "Field",
                        "emoji": false
                    }
                ]
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(context)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testContext_ShouldEncodeCorrectly_MixedFields() {
        let context = Context {
            PlainText(text: "Field", emoji: false)
            Markdown(text: "*Cat*")
        }
        let jsonResult = """
            {
                "type": "context",
                "elements": [
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
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(context)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testContext_ShouldEncodeCorrectly", testContext_ShouldEncodeCorrectly),
        ("testContext_ShouldEncodeCorrectly_MixedFields", testContext_ShouldEncodeCorrectly_MixedFields)
    ]
}
