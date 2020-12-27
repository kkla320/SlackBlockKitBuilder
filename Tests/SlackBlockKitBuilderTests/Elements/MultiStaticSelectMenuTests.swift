//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import XCTest
import SlackBlockKitBuilder

final class MultiStaticSelectTests: XCTestCase {
    func testMultiStaticSelectMenu_Options() {
        let multiSelectMenu = MultiStaticSelect(actionId: "text1234") {
            PlainText(text: "Select items")
        } options: {
            Option(value: "value-0") {
                PlainText(text: "this is plain_text text")
            }
            Option(value: "value-1") {
                PlainText(text: "this is plain_text text")
            }
            Option(value: "value-2") {
                PlainText(text: "this is plain_text text")
            }
        }

        XCTAssertEncodedStructure(encodable: multiSelectMenu, structure: [
            "type": "multi_static_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select items"
            ],
            "options": [
                [
                    "text": [
                        "type": "plain_text",
                        "text": "this is plain_text text"
                    ],
                    "value": "value-0"
                ],
                [
                    "text": [
                        "type": "plain_text",
                        "text": "this is plain_text text"
                    ],
                    "value": "value-1"
                ],
                [
                    "text": [
                        "type": "plain_text",
                        "text": "this is plain_text text"
                    ],
                    "value": "value-2"
                ]
            ]
        ])
    }
    
    func testMultiStaticSelectMenu_Options_OptionalFields() {
        let multiSelectMenu = MultiStaticSelect(actionId: "text1234") {
            PlainText(text: "Select items")
        } options: {
            Option(value: "value-0") {
                PlainText(text: "this is plain_text text")
            }
        }
        .maxSelectedItems(2)
        .initialOptions {
            Option(value: "value-0") {
                PlainText(text: "this is plain_text text")
            }
        }

        XCTAssertEncodedStructure(encodable: multiSelectMenu, structure: [
            "type": "multi_static_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select items"
            ],
            "max_selected_items": 2,
            "initial_options": [
                [
                    "text": [
                        "type": "plain_text",
                        "text": "this is plain_text text"
                    ],
                    "value": "value-0"
                ]
            ],
            "options": [
                [
                    "text": [
                        "type": "plain_text",
                        "text": "this is plain_text text"
                    ],
                    "value": "value-0"
                ]
            ]
        ])
    }
    
    func testMultiStaticSelectMenu_OptionGroups() {
        let multiSelectMenu = MultiStaticSelect(actionId: "text1234") {
            PlainText(text: "Select items")
        } optionGroups: {
            OptionGroup {
                PlainText(text: "Group")
            } options: {
                Option(value: "value-0") {
                    PlainText(text: "this is plain_text text")
                }
            }
        }

        XCTAssertEncodedStructure(encodable: multiSelectMenu, structure: [
            "type": "multi_static_select",
            "action_id": "text1234",
            "placeholder": [
                "type": "plain_text",
                "text": "Select items"
            ],
            "option_groups": [
                [
                    "label": [
                        "type": "plain_text",
                        "text": "Group"
                    ],
                    "options": [
                        [
                            "text": [
                                "type": "plain_text",
                                "text": "this is plain_text text"
                            ],
                            "value": "value-0"
                        ]
                    ]
                ]
            ]
        ])
        
        func testMultiStaticSelectMenu_OptionGroups_OptionalFields() {
            let multiSelectMenu = MultiStaticSelect(actionId: "text1234") {
                PlainText(text: "Select items")
            } optionGroups: {
                OptionGroup {
                    PlainText(text: "Group")
                } options: {
                    Option(value: "value-0") {
                        PlainText(text: "this is plain_text text")
                    }
                }
            }
            .maxSelectedItems(2)
            .initialOptions {
                Option(value: "value-0") {
                    PlainText(text: "this is plain_text text")
                }
            }

            XCTAssertEncodedStructure(encodable: multiSelectMenu, structure: [
                "type": "multi_static_select",
                "action_id": "text1234",
                "placeholder": [
                    "type": "plain_text",
                    "text": "Select items"
                ],
                "max_selected_items": 2,
                "initial_options": [
                    [
                        "text": [
                            "type": "plain_text",
                            "text": "this is plain_text text"
                        ],
                        "value": "value-0"
                    ]
                ],
                "option_groups": [
                    [
                        "label": [
                            "type": "plain_text",
                            "text": "Group"
                        ],
                        "options": [
                            [
                                "text": [
                                    "type": "plain_text",
                                    "text": "this is plain_text text"
                                ],
                                "value": "value-0"
                            ]
                        ]
                    ]
                ]
            ])
        }
    }

    static var allTests = [
        ("testMultiStaticSelectMenu_Options", testMultiStaticSelectMenu_Options)
    ]
}
