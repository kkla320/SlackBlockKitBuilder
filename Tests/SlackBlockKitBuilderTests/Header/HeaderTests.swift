//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class HeaderTests: XCTestCase {
    func testHeader_ShouldEncodeCorrectly() {
        let header = Header {
            PlainText(text: "Github", emoji: true)
        }
        let jsonResult = """
            {
                "type": "header",
                "text": {
                    "type": "plain_text",
                    "text": "Github",
                    "emoji": true
                }
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(header)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testHeader_ShouldEncodeCorrectly", testHeader_ShouldEncodeCorrectly),
    ]
}
