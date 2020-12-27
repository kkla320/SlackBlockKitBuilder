//
//  File.swift
//
//
//  Created by Kevin Klaebe on 23.12.20.
//

import XCTest
import SlackBlockKitBuilder

final class MultiConversationSelectMenuTests: XCTestCase {
    func testMultiConversationSelectMenu() {
        let multiConversationSelectMenu = MultiConversationSelectMenu(actionId: "text1234") {
            PlainText(text: "Select items")
        }
        
        XCTAssertEncodedStructure(encodable: multiConversationSelectMenu, structure: [
            "type": "multi_conversations_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select items"
            ]
        ])
    }
    
    func testMultiConversationSelectMenu_OptionalFields() {
        let multiConversationSelectMenu = MultiConversationSelectMenu(actionId: "text1234", initialConversations: ["Test"], defaultToCurrentConversation: true, maxSelectedItems: 2, filter: ConversationFilter(include: [.public], excludeExternalSharedChannels: true, excludeBotUsers: true)) {
            PlainText(text: "Select items")
        }
        
        XCTAssertEncodedStructure(encodable: multiConversationSelectMenu, structure: [
            "type": "multi_conversations_select",
            "action_id": "text1234",
            "initial_conversations": [
                "Test"
            ],
            "default_to_current_conversation": true,
            "max_selected_items": 2,
            "filter": [
                "include": [
                    "public"
                ],
                "exclude_external_shared_channels": true,
                "exclude_bot_users": true
            ],
            "placeholder": [
                "type": "plain_text",
                "text": "Select items"
            ]
        ])
    }

    static var allTests = [
        ("testMultiConversationSelectMenu", testMultiConversationSelectMenu)
    ]
}
