//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.11.20.
//

import Foundation

public struct DatePicker: BlockElement1 {
    private var actionId: String
    private var initialDate: Date?
    private var placeholder: PlainText?
    
    public var type: ElementType {
        return .datePicker
    }
    
    public init(actionId: String, initialDate: Date?, _ placeholder: () -> PlainText) {
        self.actionId = actionId
        self.initialDate = initialDate
        self.placeholder = placeholder()
    }
    
    public init(actionId: String, initialDate: Date?) {
        self.actionId = actionId
        self.initialDate = initialDate
        self.placeholder = nil
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(actionId, forKey: .actionId)
        try container.encodeIfPresent(placeholder, forKey: .placeholder)
        try container.encodeIfPresent(initialDate.map { format(date: $0) }, forKey: .initialDate)
    }
    
    private func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        return dateFormatter.string(from: date)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case placeholder
        case initialDate = "initial_date"
    }
}

extension ElementType {
    static var datePicker: ElementType {
        return ElementType(type: "datepicker")
    }
}
