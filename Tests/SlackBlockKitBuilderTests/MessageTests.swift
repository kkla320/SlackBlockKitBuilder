//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class MessageTests: XCTestCase {
    func testMessage_ShouldEncodeCorrectly_ForEach() {
        let message = Message {
            ForEach(data: 0..<2) { index in
                Section {
                    PlainText(text: "\(index)")
                        .emoji(true)
                }
            }
            Context {
                PlainText(text: "Footer")
                    .emoji(true)
            }
        }
        let jsonResult = """
            {
                "blocks": [
                    {
                        "type": "section",
                        "text": {
                            "type": "plain_text",
                            "text": "0",
                            "emoji": true
                        }
                    },
                    {
                        "type": "section",
                        "text": {
                            "type": "plain_text",
                            "text": "1",
                            "emoji": true
                        }
                    },
                    {
                        "type": "context",
                        "elements": [
                            {
                                "type": "plain_text",
                                "text": "Footer",
                                "emoji": true
                            }
                        ]
                    }
                ]
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(message)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testMessage_ShouldEncodeCorrectly_IfFalse() {
        let execute = false
        
        let message = Message {
            if execute {
                Section {
                    PlainText(text: "WElt")
                        .emoji(true)
                }
            }
            Section {
                PlainText(text: "Hallo")
                    .emoji(true)
            }
        }
        let jsonResult = """
            {
                "blocks": [
                    {
                        "type": "section",
                        "text": {
                            "type": "plain_text",
                            "text": "Hallo",
                            "emoji": true
                        }
                    }
                ]
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(message)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testMessage_ShouldEncodeCorrectly_IfTrue() {
        let execute = true
        
        let message = Message {
            if execute {
                Section {
                    PlainText(text: "Welt")
                        .emoji(true)
                }
            }
            Section {
                PlainText(text: "Hallo")
                    .emoji(true)
            }
        }
        let jsonResult = """
            {
                "blocks": [
                    {
                        "type": "section",
                        "text": {
                            "type": "plain_text",
                            "text": "Welt",
                            "emoji": true
                        }
                    },
                    {
                        "type": "section",
                        "text": {
                            "type": "plain_text",
                            "text": "Hallo",
                            "emoji": true
                        }
                    }
                ]
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(message)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testMessage_ShouldEncodeCorrectly_IfElse() {
        let execute = false
        
        let message = Message {
            if execute {
                Section {
                    PlainText(text: "Welt")
                        .emoji(true)
                }
            }
            else {
                Section {
                    PlainText(text: "World")
                        .emoji(true)
                }
            }
            Section {
                PlainText(text: "Hallo")
                    .emoji(true)
            }
        }
        let jsonResult = """
            {
                "blocks": [
                    {
                        "type": "section",
                        "text": {
                            "type": "plain_text",
                            "text": "World",
                            "emoji": true
                        }
                    },
                    {
                        "type": "section",
                        "text": {
                            "type": "plain_text",
                            "text": "Hallo",
                            "emoji": true
                        }
                    }
                ]
            }
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(message)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
}
