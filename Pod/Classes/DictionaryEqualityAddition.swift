//
//  DictionaryEqualityAddition.swift
//  Pomodoro
//
//  Created by Vincent Bernier on 25-02-2016.
//  Copyright © 2016 Vincent Bernier. All rights reserved.
//

import Swift

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

