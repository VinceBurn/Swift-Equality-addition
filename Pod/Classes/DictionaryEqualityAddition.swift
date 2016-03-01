//
//  DictionaryEqualityAddition.swift
//  Pomodoro
//
//  Created by Vincent Bernier on 25-02-2016.
//  Copyright © 2016 Vincent Bernier. All rights reserved.
//

import Swift

// This is horrible, is there a way to make this method more generic, without breaking Set
@warn_unused_result
public func ==<Key: Equatable, Value: Equatable>(lhs: [Key : [Value]], rhs: [Key : [Value]]) -> Bool {
    
    var result = lhs.count == rhs.count
    for (k, v) in lhs {
        
        guard let rVal = rhs[k] where result == true else {
            result = false
            break
        }
        result = rVal == v
    }
    
    return result
}

@warn_unused_result
public func ==<Key: Equatable, InKey: Equatable, Value: Equatable>(lhs: [Key : [InKey : Value]], rhs: [Key : [InKey : Value]]) -> Bool {
    var result = lhs.count == rhs.count
    for (k, v) in lhs {
        
        guard let rVal = rhs[k] where result == true else {
            result = false
            break
        }
        result = rVal == v
    }
    
    return result
}


