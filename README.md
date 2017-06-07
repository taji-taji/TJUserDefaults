[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](#carthage)
![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg)

# What is this?

This library is intended to make UserDefaults easier to use.
And this is simple implementation of SwiftyUserDefaults (https://github.com/radex/SwiftyUserDefaults)


There are some merits.

- Decrease String literals of UserDefaults key
- You can set and get a value of UserDefaults in natural notation
- This makes type of keys strict

# Requirements

- iOS 8.2+
- Swift3.0+

# Usual usage of UserDefaults

```swift
let userDefaults = UserDefaults.standard

// set
userDefaults.set(true, forKey: "MyBool")
userDefaults.set(1, forKey: "MyInteger")
userDefaults.set("foo", forKey: "MyString")

// get
let myBool = userDefaults.bool(forKey: "MyBool")
let myInteger = userDefaults.integer(forKey: "MyInteger")
let myString = userDefaults.string(forKey: "MyString")
```

# Usage of TJUserDefaults

## First, Define UserDefaultsKeys

```swift
extension UserDefaultsKeys {
    static var myBool = DefaultsKey<Bool>("MyBool")
    static var myInteger = DefaultsKey<Int>("MyInteger")
    static var myString = DefaultsKey<String>("MyString")
}
```

## Use keys

```swift
// set
userDefaults[UserDefaultsKeys.myBool] = true
userDefaults[UserDefaultsKeys.myInteger] = 1
userDefaults[UserDefaultsKeys.myString] = "foo"

// get
let myBool = userDefaults[UserDefaultsKeys.myBool]
let myInteger = userDefaults[UserDefaultsKeys.myInteger]
let myString = userDefaults[UserDefaultsKeys.myString]
```

```swift
// Type safe example. This occurs compile error!
let myString: String = userDefaults[UserDefaultsKeys.myBool]
// Cannot convert value of type 'Bool' to specifed type 'String'
```

This is very safety.

# Installation

## Carthage

Just add to your Cartfile:

```
github "taji-taji/TJUserDefaults"
```

# License
MIT
