//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 26.11.20.
//

import XCTest
@testable import SlackBlockKitBuilder

final class TextFieldsTests: XCTestCase {
    func testTextFields() {
        let textFields = TextFields {
            PlainText(text: "Field")
                .emoji(false)
        }
        
        XCTAssertEqual(textFields.elements.count, 1)
        XCTAssertEqual(textFields.elements[0].type, .plainText)
    }
    
    func testTextFields_MixedFields() {
        let textFields = TextFields {
            PlainText(text: "Field")
                .emoji(false)
            Markdown(text: "*Cat*")
                .verbatim(false)
        }
        
        XCTAssertEqual(textFields.elements.count, 2)
        XCTAssertEqual(textFields.elements[0].type, .plainText)
        XCTAssertEqual(textFields.elements[1].type, .markdown)
    }

    func testTextFields_ForEach() {
        let textFields = TextFields {
            ForEach(data: 0..<2) { index in
                PlainText(text: "\(index)")
                    .emoji(false)
            }
        }
        
        
        XCTAssertEqual(textFields.elements.count, 2)
        XCTAssertEqual(textFields.elements[0].type, .plainText)
        XCTAssertEqual(textFields.elements[1].type, .plainText)
    }
    
    func testTextFields_ForEach_ExtraElement() {
        let textFields = TextFields {
            ForEach(data: 0..<2) { index in
                PlainText(text: "\(index)")
                    .emoji(false)
            }
            Markdown(text: "*Cat*")
                .verbatim(false)
        }
        
        
        XCTAssertEqual(textFields.elements.count, 3)
        XCTAssertEqual(textFields.elements[0].type, .plainText)
        XCTAssertEqual(textFields.elements[1].type, .plainText)
        XCTAssertEqual(textFields.elements[2].type, .markdown)
    }

    func testTextFields_ForEach_WithForEach() {
        let textFields = TextFields {
            ForEach(data: 0..<2) { index in
                ForEach(data: 0..<2) { index1 in
                    PlainText(text: "\(index)\(index1)")
                        .emoji(false)
                }
            }
        }
        
        
        XCTAssertEqual(textFields.elements.count, 4)
        XCTAssertEqual(textFields.elements[0].type, .plainText)
        XCTAssertEqual(textFields.elements[1].type, .plainText)
        XCTAssertEqual(textFields.elements[2].type, .plainText)
        XCTAssertEqual(textFields.elements[3].type, .plainText)
    }

    func testTextFields_IfTrue() {
        let execute = true
        let textFields = TextFields {
            PlainText(text: "Field")
                .emoji(false)
            if execute {
                PlainText(text: "Field2")
                    .emoji(false)
            }
        }
        
        XCTAssertEqual(textFields.elements.count, 2)
        XCTAssertEqual(textFields.elements[0].type, .plainText)
        XCTAssertEqual(textFields.elements[1].type, .plainText)
    }

    func testTextFields_IfFalse() {
        let execute = false
        let textFields = TextFields {
            PlainText(text: "Field")
                .emoji(false)
            if execute {
                PlainText(text: "Field2")
                    .emoji(false)
            }
        }
        
        XCTAssertEqual(textFields.elements.count, 1)
        XCTAssertEqual(textFields.elements[0].type, .plainText)
    }

    func testTextFields_IfElse() {
        let execute = false
        let textFields = TextFields {
            PlainText(text: "Field")
                .emoji(false)
            if execute {
                Markdown(text: "Field2")
                    .verbatim(false)
            }
            else {
                PlainText(text: "Field3")
                    .emoji(false)
            }
        }
        
        XCTAssertEqual(textFields.elements.count, 2)
        XCTAssertEqual(textFields.elements[0].type, .plainText)
        XCTAssertEqual(textFields.elements[1].type, .plainText)
    }

    static var allTests = [
        ("testTextFields", testTextFields),
        ("testTextFields_MixedFields", testTextFields_MixedFields),
        ("testTextFields_ForEach", testTextFields_ForEach),
        ("testTextFields_ForEach_ExtraElement", testTextFields_ForEach_ExtraElement),
        ("testTextFields_ForEach_WithForEach", testTextFields_ForEach_WithForEach),
        ("testTextFields_IfTrue", testTextFields_IfTrue),
        ("testTextFields_IfFalse", testTextFields_IfFalse),
        ("testTextFields_IfElse", testTextFields_IfElse),
    ]
}
