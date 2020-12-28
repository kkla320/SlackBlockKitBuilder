//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import XCTest
import SlackBlockKitBuilder

final class MultiUsersSelectTests: XCTestCase {
    func testMultiUsersSelectMenu() {
        let multiUsersMenu = MultiUsersSelect(actionId: "text1234") {
            PlainText(text: "Select users")
        }

        XCTAssertEncodedStructure(encodable: multiUsersMenu, structure: [
            "type": "multi_users_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select users"
            ]
        ])
    }
    
    func testMultiUsersSelectMenu_OptionalFields() {
        let multiUsersMenu = MultiUsersSelect(actionId: "text1234") {
            PlainText(text: "Select users")
        }
        .initialUsers(["1", "2"])
        .maxSelectedItems(2)

        XCTAssertEncodedStructure(encodable: multiUsersMenu, structure: [
            "type": "multi_users_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select users"
            ],
            "initial_users": [
                "1",
                "2"
            ],
            "max_selected_items": 2
        ])
    }

    static var allTests = [
        ("testMultiUsersSelectMenu", testMultiUsersSelectMenu)
    ]
}
