# CacherKit

iOS 简单缓存管理库，支持内存、磁盘、钥匙串，接口统一。

[![Platform](https://img.shields.io/cocoapods/p/CacherKit.svg?style=flat)](https://github.com/ZuopanYao/CacherKit)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/CacherKit.svg)](https://cocoapods.org/pods/CacherKit)


## Requirements / 使用条件

- iOS 11.0+ 
- Xcode 10.2+
- Swift 5.0+


## Installation / 安装

### CocoaPods

```
pod 'CacherKit'
```

### Manually / 手动安装

If you prefer not to use either of the aforementioned dependency managers, you can integrate CacherKit into your project manually.

如果您不喜欢以上管理依赖库的方式，则可以手动将 CacherKit 集成到项目中。


## Usage / 使用
### Swift

#### Define Your Key
```
import CacherKit

extension CKKey {
    static let mykey: CKKey = .init("mykey")
}

```

#### Adding an item
```
/// Saving to disk (With UserDefaults)
CK.disk.set("TestString", key: .mykey)
        
/// Saving to memory
CK.memory.set("TestString", key: .mykey)
        
/// Saving to keychain
CK.keychain.set("TestString", key: .mykey)
```

#### Obtaining an item (subscripting)
```
//let value = CK.disk[.mykey]
//let value = CK.keychain[.mykey]
let value = CK.memory[.mykey]
        
// Convert to String
let str = value.string

// Convert to Data
let data = value.data
```

#### Removing an item
##### set nil
```
 /// Removing from disk (With UserDefaults)
CK.disk.set(nil, key: .mykey)
    
/// Removing from memory
CK.memory.set(nil, key: .mykey)
    
/// Removing from keychain
CK.keychain.set(nil, key: .mykey)
```

##### Remove method
```
/// Removing from disk (With UserDefaults)
CK.disk.remove(.mykey)
    
/// Removing from memory
CK.memory.remove(.mykey)
    
/// Removing from keychain
CK.keychain.remove(.mykey)
```


## License / 许可证

CacherKit is released under the MIT license. See LICENSE for details.

CacherKit 是在 MIT 许可下发布的，有关详情请查看该许可证。