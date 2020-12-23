//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class DividerTests: XCTestCase {
    func testDivider() {
        let divider = Divider()
        
        XCTAssertEncodedStructure(encodable: divider, structure: [
            "type": "divider"
        ])
    }

    static var allTests = [
        ("testDivider", testDivider)
    ]
}
