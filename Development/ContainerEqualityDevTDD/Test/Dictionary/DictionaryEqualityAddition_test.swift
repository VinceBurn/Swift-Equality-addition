//
//  DictionaryEqualityAddition_test.swift
//  Pomodoro
//
//  Created by Vincent Bernier on 25-02-2016.
//  Copyright © 2016 Vincent Bernier. All rights reserved.
//

import XCTest
import ContainerEquality

class DictionaryEqualityAddition_test: XCTestCase {
    
    let baseControlArrayLet = ["key" : ["val0", "val1"], "3" : ["three", "trois", "tri"], "vide" : []]
    var baseControlArrayVar = ["key" : ["val0", "val1"], "3" : ["three", "trois", "tri"], "vide" : []]
    
    //MARK:- Dictionary of [Equitable] value
    func test_givenDicOfArrayValue_whenItemCountIsDiffrent_thenEqualityFalse() {
        baseControlArrayVar.popFirst()
        XCTAssertFalse(baseControlArrayLet == baseControlArrayVar)
    }
    
    func test_givenDicOfArrayValue_whenItemCountIsSameWithIdenticalKeyAndValue_thenEqualityTrue() {
        XCTAssertTrue(baseControlArrayLet == baseControlArrayVar)
    }
    
    func test_givenDicOfArrayValue_whenIdenticalCountWithIdenticalValueOneDifferentKey_thenEqualityFalse() {
        let val = baseControlArrayVar["key"]!
        baseControlArrayVar.removeValueForKey("key")
        baseControlArrayVar["alkdfj"] = val
        XCTAssertFalse(baseControlArrayLet == baseControlArrayVar)
    }
    
    func test_givenDicOfArrayValue_whenIdenticalCountWithIdenticalKeysOneDifferentValue_thenEqualityFalse() {
        baseControlArrayVar["key"] = ["lol"]
        XCTAssertFalse(baseControlArrayLet == baseControlArrayVar)
    }
    
    func test_performanceOfFullEqualityOfBigInput() {
        let keys = Array(0...100000)
        let value = Array(3000...4000)
        var dic = [Int : [Int]]()
        for k in keys {
            dic[k] = value
        }
        
        let control1 = dic
        let control2 = dic
        
        measureBlock { () -> Void in
            let _ = control1 == control2
        }
    }
    
    //MAKR:- Dictionary of other collections as value
    func test_givenDicOfSetValue_whenIdentical_thenEqualityTrue() {
        
        //  NOTE: Set is Hashable, so it doesn't go through our new method
        //      --> This is a test to validate that we don't make Set equality ambiguous.
        let baseControlSetLet = ["key" : Set<Int>(arrayLiteral: 1, 2, 3)]
        let baseControlSetLet2 = baseControlSetLet
        XCTAssertTrue(baseControlSetLet == baseControlSetLet2)
    }
}
