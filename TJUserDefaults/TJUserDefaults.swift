/*
 MIT License
 
 Copyright (c) 2016 Yutaka
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */
import Foundation

public let userDefaults = Foundation.UserDefaults.standard

/**
 UserDefaultsを扱うstruct
 UserDefaultsに保存する値は、キーをUserDefaultsKeysで定義する
 ```
 UserDefaults[UserDefaultsKeys.userID] = 1
 let userId = UserDefaults[UserDefaultsKeys.userID]
 ```
 */
public struct UserDefaultsKeys {}

public struct DefaultsKey<ValueType> {
    let key: String
    
    public init(_ key: String) {
        self.key = key
    }
}

public extension Foundation.UserDefaults {
    
    public subscript(key: DefaultsKey<Bool>) -> Bool {
        get {
            return bool(forKey: key.key)
        }
        set {
            set(newValue, forKey: key.key)
            synchronize()
        }
    }
    
    public subscript(key: DefaultsKey<Int>) -> Int {
        get {
            return integer(forKey: key.key)
        }
        set {
            set(newValue, forKey: key.key)
            synchronize()
        }
    }
    
    public subscript(key: DefaultsKey<String>) -> String {
        get {
            return string(forKey: key.key) ?? ""
        }
        set {
            set(newValue, forKey: key.key)
            synchronize()
        }
    }
    
    public subscript(key: DefaultsKey<Array<String>>) -> Array<String> {
        get {
            return stringArray(forKey: key.key) ?? []
        }
        set {
            set(newValue, forKey: key.key)
            synchronize()
        }
    }
    
    public subscript(key: DefaultsKey<AnyObject>) -> AnyObject? {
        get {
            return object(forKey: key.key) as AnyObject?
        }
        set {
            set(newValue, forKey: key.key)
            synchronize()
        }
    }
    
}
