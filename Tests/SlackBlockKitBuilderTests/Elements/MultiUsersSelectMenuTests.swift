//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import XCTest
import SlackBlockKitBuilder

final class MultiUsersSelectMenuTests: XCTestCase {
    func testMultiUsersSelectMenu() {
        let multiUsersMenu = MultiUsersSelectMenu(actionId: "text1234") {
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
    
    func testMultiUsersSelectMenu_InitialUsers() {
        let multiUsersMenu = MultiUsersSelectMenu(actionId: "text1234", initialUsers: ["1", "2"]) {
            PlainText(text: "Select users")
        }

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
            ]
        ])
    }
    
    func testMultiUsersSelectMenu_MaxSelectedItems() {
        let multiUsersMenu = MultiUsersSelectMenu(actionId: "text1234", maxSelectedItems: 2) {
            PlainText(text: "Select users")
        }

        XCTAssertEncodedStructure(encodable: multiUsersMenu, structure: [
            "type": "multi_users_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select users"
            ],
            "max_selected_items": 2
        ])
    }

    static var allTests = [
        ("testMultiUsersSelectMenu", testMultiUsersSelectMenu)
    ]
}
