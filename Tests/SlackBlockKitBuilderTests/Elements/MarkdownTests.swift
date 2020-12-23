//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class MarkdownTests: XCTestCase {
    func testMarkdown() {
        let markdown = Markdown(text: "Markdown", verbatim: false)
        
        XCTAssertEncodedStructure(encodable: markdown, structure: [
            "type": "mrkdwn",
            "text": "Markdown",
            "verbatim": false
        ])
    }

    static var allTests = [
        ("testMarkdown", testMarkdown)
    ]
}
