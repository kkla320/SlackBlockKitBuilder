//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class PlainTextTests: XCTestCase {
    func testPlainText_ShouldEncodeCorrectly() {
        let plainText = PlainText(text: "Header", emoji: false)
        let jsonResult = """
            {
                "type": "plain_text",
                "text": "Header",
                "emoji": false
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(plainText)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testPlainText_ShouldEncodeCorrectly", testPlainText_ShouldEncodeCorrectly)
    ]
}
