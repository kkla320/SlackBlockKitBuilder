//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class DividerTests: XCTestCase {
    func testDivider_ShouldEncodeCorrectly() {
        let divider = Divider()
        let jsonResult = """
            {
                "type": "divider"
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
        ("testDivider_ShouldEncodeCorrectly", testDivider_ShouldEncodeCorrectly)
    ]
}
