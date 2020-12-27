//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.12.20.
//

import XCTest
import SlackBlockKitBuilder

final class DatePickerTests: XCTestCase {
    func testDatePicker() {
        let datePicker = DatePicker(actionId: "action_0")
        
        XCTAssertEncodedStructure(encodable: datePicker, structure: [
            "action_id": "action_0",
            "type": "datepicker"
        ])
    }
    
    func testDatePicker_OptionalFields() {
        let datePicker = DatePicker(actionId: "action_0")
            .placeholder {
                PlainText(text: "Text")
            }
            .initialDate(Date(timeIntervalSince1970: 971136000))
        
        XCTAssertEncodedStructure(encodable: datePicker, structure: [
            "action_id": "action_0",
            "type": "datepicker",
            "placeholder": [
                "type": "plain_text",
                "text": "Text"
            ],
            "initial_date": "2000-10-10"
        ])
    }

    static var allTests = [
        ("testDatePicker", testDatePicker)
    ]
}

