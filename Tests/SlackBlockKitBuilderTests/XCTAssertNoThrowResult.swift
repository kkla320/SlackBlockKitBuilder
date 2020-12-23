//
//  File.swift
//
//
//  Created by Kevin Klaebe on 29.11.20.
//

import XCTest
import DictionaryCoding

func XCTAssertNoThrowResult<Result>(_ call: () throws -> Result) -> Result? {
    do {
        return try call()
    } catch let error {
        XCTFail("Call failed with error \(error)")
        return nil
    }
}

func XCTAssertEncodedStructure<Input>(encodable: Input, structure: NSDictionary) where Input: Encodable {
    let encodingResult: NSDictionary? = XCTAssertNoThrowResult {
        try DictionaryEncoder().encode(encodable)
    }
    
    XCTAssertEqual(encodingResult, structure)
}
