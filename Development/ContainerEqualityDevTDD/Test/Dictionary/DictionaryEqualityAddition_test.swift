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
    
    //MARK:- Dictionary of [Equitable] value
    let baseControlArrayLet = ["key" : ["val0", "val1"], "3" : ["three", "trois", "tri"], "vide" : []]
    var baseControlArrayVar = ["key" : ["val0", "val1"], "3" : ["three", "trois", "tri"], "vide" : []]
    
    func test_givenDicOfArrayValue_whenItemCountIsDiffrent_thenEqualityFalse() {
        baseControlArrayVar.popFirst()
        XCTAssertFalse(baseControlArrayLet == baseControlArrayVar)
    }
    
    func test_givenDicOfArrayValue_whenItemCountIsSameWithIdenticalKeyAndValue_thenEqualityTrue() {
        XCTAssertTrue(baseControlArrayLet == baseControlArrayVar)
    }
    
    func test_givenDicOfArrayValue_whenIdenticalCountWithIdenticalValueAndOneDifferentKey_thenEqualityFalse() {
        let val = baseControlArrayVar["key"]!
        baseControlArrayVar.removeValueForKey("key")
        baseControlArrayVar["alkdfj"] = val
        XCTAssertFalse(baseControlArrayLet == baseControlArrayVar)
    }
    
    func test_givenDicOfArrayValue_whenIdenticalCountWithIdenticalKeysAndOneDifferentValue_thenEqualityFalse() {
        baseControlArrayVar["key"] = ["lol"]
        XCTAssertFalse(baseControlArrayLet == baseControlArrayVar)
    }
    
    func test_givenDicOfArrayValueWithBigInput_whenEqual_thenPerformanceDontDeteriorate() {
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
    
    //MARK:- Dictionary of [Equitable : Equitable]
    let baseControllerDicLet = ["key0" : ["innerKey0" : "innerValue0"], "key1" : ["innerKey1" : "innerValue1"]]
    var baseControllerDicVar = ["key0" : ["innerKey0" : "innerValue0"], "key1" : ["innerKey1" : "innerValue1"]]
    
    func test_givenDicOfDicValue_whenItemCountIsDifferent_thenEqualFalse() {
        baseControllerDicVar.removeAtIndex(baseControllerDicVar.indexForKey("key0")!)
        XCTAssertFalse(baseControllerDicLet == baseControllerDicVar)
    }
    
    func test_givenDicOfDicValue_whenBothHaveDeepEquality_thenEqualTrue() {
        XCTAssertTrue(baseControllerDicLet == baseControllerDicVar)
    }
    
    func test_givenDicOfDicValue_whenIdenticalCountWithIdenticalValueOneDifferentKey_thenEqualityFalse() {
        let val = baseControllerDicVar["key0"]!
        baseControllerDicVar.removeValueForKey("key0")
        baseControllerDicVar["aldsjf"] = val
        XCTAssertFalse(baseControllerDicLet == baseControllerDicVar)
    }
    
    func test_givenDicOfDicValue_whenIdenticalCountWithIdenticalKeysOneDifferentValue_thenEqualityFalse() {
        baseControllerDicVar["key0"] = ["lol" : "yep!"]
        XCTAssertFalse(baseControllerDicLet == baseControllerDicVar)
    }
    
    func test_givenDicOfDicValue_whenIdenticalEveryThingsExceptOneInsideValue_thenEqualityFalse() {
        baseControllerDicVar["key0"]!["innerKey0"] = "aldjksf"
        XCTAssertFalse(baseControllerDicLet == baseControllerDicVar)
    }
    
    func test_givenDicOfDicValue_whenIdenticalEveryThingsExceptOneInsideKey_thenEqualityFalse() {
        let dic = ["adlkfj" : baseControllerDicVar["key0"]!["innerKey0"]!]
        baseControllerDicVar["key0"] = dic
        XCTAssertFalse(baseControllerDicLet == baseControllerDicVar)
    }
    
    func test_performanceOfFullEqualityOfBigInput_forDicOfValue() {
        let keys = Array(0...1000)
        
        var value = [String : Int]()
        for i in 0...50 {
            value[String(i)] = i
        }
        var dic = [Int : [String : Int]]()
        for k in keys {
            dic[k] = value
        }
        
        let control1 = dic
        let control2 = dic
        
        measureBlock { () -> Void in
            let _ = control1 == control2
        }
    }
    
//    func test_test() {
//        let dic0 = ["key" : ["key" : ["val"]]]
//        let dic1 = ["key" : ["key" : ["val"]]]
//        XCTAssertTrue(dic0 == dic1)
//    }
    
    //MARK:- Not Breaking existing Equality
    func test_givenDicOfSetValue_whenIdentical_thenEqualityTrue() {
        
        //  NOTE: Set is Hashable, so it doesn't go through our new method
        //      --> This is a test to validate that we don't make Set equality ambiguous.
        let baseControlSetLet = ["key" : Set<Int>(arrayLiteral: 1, 2, 3)]
        let baseControlSetLet2 = baseControlSetLet
        XCTAssertTrue(baseControlSetLet == baseControlSetLet2)
    }
}
