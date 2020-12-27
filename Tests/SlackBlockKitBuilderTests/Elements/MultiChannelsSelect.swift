//
//  File.swift
//
//
//  Created by Kevin Klaebe on 23.12.20.
//

import XCTest
import SlackBlockKitBuilder

final class MultiChannelsSelectMenuTests: XCTestCase {
    func testMultiChannelsSelectMenu() {
        let multiChannelsSelectMenu = MultiChannelsSelect(actionId: "text1234") {
            PlainText(text: "Select items")
        }
        
        XCTAssertEncodedStructure(encodable: multiChannelsSelectMenu, structure: [
            "type": "multi_channels_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select items"
            ]
        ])
    }
    
    func testMultiChannelsSelectMenu_OptionalFields() {
        let multiChannelsSelectMenu = MultiChannelsSelect(actionId: "text1234") {
            PlainText(text: "Select items")
        }
        .initialChannels(["Channel"])
        .maxSelectedItems(2)
        
        XCTAssertEncodedStructure(encodable: multiChannelsSelectMenu, structure: [
            "type": "multi_channels_select",
            "action_id": "text1234",
            "initial_channels": [
                "Channel"
            ],
            "max_selected_items": 2,
            "placeholder": [
                "type": "plain_text",
                "text": "Select items"
            ]
        ])
    }

    static var allTests = [
        ("testMultiChannelsSelectMenu", testMultiChannelsSelectMenu)
    ]
}
