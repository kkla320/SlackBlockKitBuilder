//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class ActionsTests: XCTestCase {
    func testActions_ShouldEncodeCorrectly() {
        let divider = Actions {
            Button(url: "https://github.com") {
                PlainText(text: "Test", emoji: false)
            }
        }
        let jsonResult = """
            {
                "type": "actions",
                "elements": [
                    {
                        "type": "button",
                        "text": {
                            "type": "plain_text",
                            "text": "Test",
                            "emoji": false
                        },
                        "url": "https:\\/\\/github.com"
                    }
                ]
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(divider)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testActions_ShouldEncodeCorrectly", testActions_ShouldEncodeCorrectly)
    ]
}
