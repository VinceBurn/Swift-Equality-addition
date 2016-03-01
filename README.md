# Swift-Equality-addition

## Starting Point
I like Swift, but I have some pain point with it that I'm trying to diminish. One of those is equality. For example this won't compile:
```
let dic0 = ["key" : ["value0" : "value1"]]
let dic1 = ["key" : ["value0" : "value1"]]
let isEqual = dic0 == dic1 // problem here
```
The problem is the way equality (==) is defined on Dictionary.
```
public func ==<Key : Equatable, Value : Equatable>(lhs: [Key : Value], rhs: [Key : Value]) -> Bool
```
The value in this definition must conforms to the Equatable protocol, which Array are not. Even when the type of the array is a type that is Equatable, String in this case, the array is **not** Equatable. A == function for Array exist for those case, but that doesn't make Array Equatable.

## Contribution
Contribution are welcome.
+ This project is purely Swift, so only the ```import Swift``` is allowed.  
+ This project will be fully unit tested, ideally in a TDD manner.  
+ Addition should be as generic as possible. (Genericness should be proven by unit test)

## Version
To ease the pain of Swift version compatibility, the version number of this tool will use the Swift version as its starting point.  
So when using Swift 2.1, the version of this tool should be 2.1.x. When using Swift 3.0, it should be 3.0.x.
