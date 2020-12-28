//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.11.20.
//

import Foundation

public struct DatePicker {
    private var actionId: String
    var initialDate: Date?
    var placeholder: PlainText?
    
    public init(actionId: String) {
        self.actionId = actionId
    }
}

extension DatePicker: Element {
    public var type: ElementType {
        return .datePicker
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
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case placeholder
        case initialDate = "initial_date"
    }
}

extension DatePicker: Changeable {
    public func initialDate(_ value: Date) -> DatePicker {
        return self.changing { $0.initialDate = value }
    }
    
    public func placeholder(_ value: () -> PlainText) -> DatePicker {
        return self.changing { $0.placeholder = value() }
    }
}

extension ElementType {
    static var datePicker: ElementType {
        return ElementType(type: "datepicker")
    }
}
