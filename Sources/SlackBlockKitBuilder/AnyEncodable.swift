//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.12.20.
//

import Foundation

class AnyEncodable: Encodable {
    private var encodeClosure: (Encoder) throws -> Void
    
    init<E>(_ encodable: E) where E: Encodable {
        self.encodeClosure = { encoder in
            try encodable.encode(to: encoder)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        try encodeClosure(encoder)
    }
}

extension Encodable {
    func eraseToAnyEncodable() -> AnyEncodable {
        return AnyEncodable(self)
    }
}

extension Array where Element: Encodable {
    func eraseToAnyEncodables() -> [AnyEncodable] {
        return self.map { $0.eraseToAnyEncodable() }
    }
}
