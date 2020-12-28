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
        let multiConversationSelectMenu = MultiConversationsSelect(actionId: "text1234") {
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
        let multiConversationSelectMenu = MultiConversationsSelect(actionId: "text1234") {
            PlainText(text: "Select items")
        }
        .initialConversations(["Test"])
        .maxSelectedItems(2)
        .defaultToCurrentConversation(true)
        .filter(ConversationFilter(
                    include: [.public],
                    excludeExternalSharedChannels: true,
                    excludeBotUsers: true)
        )
        
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
