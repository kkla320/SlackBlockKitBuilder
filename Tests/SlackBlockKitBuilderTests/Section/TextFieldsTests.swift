//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
import SlackBlockKitBuilder

final class TextFieldsTests: XCTestCase {
    func testTextFields_ShouldEncodeCorrectly() {
        let textFields = TextFields {
            PlainText(text: "Field", emoji: false)
        }
        let jsonResult = """
            [
                {
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": false
                }
            ]
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testTextFields_ShouldEncodeCorrectly_MixedFields() {
        let textFields = TextFields {
            PlainText(text: "Field", emoji: false)
            Markdown(text: "*Cat*")
        }
        let jsonResult = """
            [
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
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testTextFields_ShouldEncodeCorrectly_ForEach() {
        let textFields = TextFields {
            ForEach(data: 0..<2) { index in
                PlainText(text: "\(index)", emoji: false)
            }
            Markdown(text: "*Cat*")
        }
        let jsonResult = """
            [
                {
                    "type": "plain_text",
                    "text": "0",
                    "emoji": false
                },
                {
                    "type": "plain_text",
                    "text": "1",
                    "emoji": false
                },
                {
                    "type": "mrkdwn",
                    "text": "*Cat*"
                }
            ]
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testTextFields_ShouldEncodeCorrectly_ForEachInForEach() {
        let textFields = TextFields {
            ForEach(data: 0..<2) { index in
                ForEach(data: 0..<2) { index1 in
                    PlainText(text: "\(index)\(index1)", emoji: false)
                }
            }
            Markdown(text: "*Cat*")
        }
        let jsonResult = """
            [
                {
                    "type": "plain_text",
                    "text": "00",
                    "emoji": false
                },
                {
                    "type": "plain_text",
                    "text": "01",
                    "emoji": false
                },
                {
                    "type": "plain_text",
                    "text": "10",
                    "emoji": false
                },
                {
                    "type": "plain_text",
                    "text": "11",
                    "emoji": false
                },
                {
                    "type": "mrkdwn",
                    "text": "*Cat*"
                }
            ]
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testTextFields_ShouldEncodeCorrectly_IfTrue() {
        let execute = true
        let textFields = TextFields {
            PlainText(text: "Field", emoji: false)
            if execute {
                PlainText(text: "Field2", emoji: false)
            }
        }
        let jsonResult = """
            [
                {
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": false
                },
                {
                    "type": "plain_text",
                    "text": "Field2",
                    "emoji": false
                }
            ]
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testTextFields_ShouldEncodeCorrectly_IfFalse() {
        let execute = false
        let textFields = TextFields {
            PlainText(text: "Field", emoji: false)
            if execute {
                PlainText(text: "Field2", emoji: false)
            }
        }
        let jsonResult = """
            [
                {
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": false
                }
            ]
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }
    
    func testTextFields_ShouldEncodeCorrectly_IfElse() {
        let execute = false
        let textFields = TextFields {
            PlainText(text: "Field", emoji: false)
            if execute {
                PlainText(text: "Field2", emoji: false)
            }
            else {
                PlainText(text: "Field3", emoji: false)
            }
        }
        let jsonResult = """
            [
                {
                    "type": "plain_text",
                    "text": "Field",
                    "emoji": false
                },
                {
                    "type": "plain_text",
                    "text": "Field3",
                    "emoji": false
                }
            ]
        """.filter { !$0.isWhitespace }
        
        do {
            let encodingResult = try JSONEncoder().encode(textFields)
            let encodedJson = String(bytes: encodingResult, encoding: .utf8)
            
            XCTAssertEqual(encodedJson, jsonResult)
        } catch let error {
            XCTFail("Encoding failed with error \(error.localizedDescription)")
        }
    }

    static var allTests = [
        ("testTextFields_ShouldEncodeCorrectly", testTextFields_ShouldEncodeCorrectly)
    ]
}
