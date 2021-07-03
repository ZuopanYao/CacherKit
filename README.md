# CacherKit

Simple cache management library for iOS, support memory, disk and keychain, and this is unified interface.

iOS 简单缓存管理库，支持内存、磁盘、钥匙串，接口统一。

[![Platform](https://img.shields.io/cocoapods/p/CacherKit.svg?style=flat)](https://github.com/ZuopanYao/CacherKit)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/CacherKit.svg)](https://cocoapods.org/pods/CacherKit)

## Warning

Verstion 2.0.0 not downward compatible.

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


## Usage in Swift / 使用

### General

#### Define Your Key

- v4.0.0+

```
import CacherKit

enum MyLoveKeyName: String, CKKey {
    case someKey1
    case someKey2
    ///
    /// .....
    ///
}

```

- Old version

```
import CacherKit

extension CKKey {
    static let mykey: CKKey = .init("mykey")
}

```

#### Adding an item
```
/// Saving to disk (With UserDefaults)
CKKey.mykey.disk.string = "TestString"
        
/// Saving to memory
CKKey.mykey.memory.string = "TestString"
        
/// Saving to keychain
CKKey.mykey.keychain.string = "TestString"
```

#### Obtaining an item 

```
/// Read from disk (With UserDefaults)
let diskString = CKKey.mykey.disk.string
/// Read from keychain
let keychainString = CKKey.mykey.keychain.string
/// Read from memory
let memoryString = CKKey.mykey.memory.string
```

#### Removing an item
##### Set nil
```
 /// Removing from disk (With UserDefaults)
CKKey.mykey.disk.string = nil
    
/// Removing from memory
CKKey.mykey.memory.string = nil
    
/// Removing from keychain
CKKey.mykey.keychain.string = nil
```

##### Remove method
```
/// Removing from disk (With UserDefaults)
CKKey.mykey.disk.remove()
    
/// Removing from memory
CKKey.mykey.memory.remove()
    
/// Removing from keychain
CKKey.mykey.keychain.remove()
```

### Saving model ( Must be Codable )

#### Model Example

```
/// Must be codable
struct MyModel: Codable {
    var name: String = ""
    var age: Int = 100
}

```

#### Saving、 Obtaining and Removing

```
let model = MyModel()
        
/// Saving to disk (With UserDefaults)
model.encode(to: .disk)
    
/// Saving to memory
model.encode(to: .memory)
    
/// Saving to keychain
model.encode(to: .keychain)
    
/// Obtaining
let instanceFromDisk: MyModel? = MyModel.decode(from: .disk)
let instanceFromMemory: MyModel? = MyModel.decode(from: .memory)
let instanceFromKeychain: MyModel? = MyModel.decode(from: .keychain)
        
/// Removing
MyModel.remove(from: .disk)
MyModel.remove(from: .memory)
MyModel.remove(from: .keychain)
```


## License / 许可证

CacherKit is released under the MIT license. See LICENSE for details.

CacherKit 是在 MIT 许可下发布的，有关详情请查看该许可证。