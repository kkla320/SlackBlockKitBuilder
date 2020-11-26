//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class MarkdownTests: XCTestCase {
    func testMarkdown_ShouldEncodeCorrectly() {
        let markdown = Markdown(text: "Markdown")
        let jsonResult = """
            {
                "type": "mrkdwn",
                "text": "Markdown"
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(markdown)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testMarkdown_ShouldEncodeCorrectly", testMarkdown_ShouldEncodeCorrectly)
    ]
}
