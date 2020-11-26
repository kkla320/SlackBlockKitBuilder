//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class ButtonTests: XCTestCase {
    func testButton_ShouldEncodeCorrectly() {
        let button = Button(url: "http://github.com") {
            PlainText(text: "Github", emoji: true)
        }
        let jsonResult = """
            {
                "type": "button",
                "text": {
                    "type": "plain_text",
                    "text": "Github",
                    "emoji": true
                },
                "url": "http:\\/\\/github.com"
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(button)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testButton_ShouldEncodeCorrectly", testButton_ShouldEncodeCorrectly)
    ]
}
