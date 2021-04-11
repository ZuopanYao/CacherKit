//
//  CacheKit.swift
//  CacheKit
//
//  Created by Harvey on 2019/6/5.
//  Copyright © 2019 姚作潘/Harvey. All rights reserved.
//

import Foundation

public struct CKKey {
    
    static let lang = CKKey("AppleLanguages")
    
    var value: String
    public init(_ value: String) {
        self.value = value
    }
}

/// CacheKit
public struct CK {
    
    /// 临时缓存管理
    public static let cacher = CKStorage.shared
    
    /// 持久性缓存管理
    public static let storager = CKCacher.shared
}

public struct CacheKit<Base> {
    
    var base: Base
    fileprivate init(_ base: Base) {
        self.base = base
    }    
}

public protocol CacheKitCompatible {
    
    associatedtype CompatibleType
    
    var bk: CacheKit<CompatibleType> { get }
    static var bk: CacheKit<CompatibleType>.Type { get }
}

public extension CacheKitCompatible {
    
    var bk: CacheKit<Self> {
        get { return CacheKit(self) }
    }
    
    static var bk: CacheKit<Self>.Type {
        get { return CacheKit<Self>.self }
    }
}

extension String: CacheKitCompatible { }
extension Data: CacheKitCompatible { }
extension CKObject: CacheKitCompatible { }
extension Int: CacheKitCompatible { }
extension Float: CacheKitCompatible { }
extension Double: CacheKitCompatible { }
extension Array: CacheKitCompatible { }
extension URL: CacheKitCompatible { }
extension CKType: CacheKitCompatible { }
extension Date: CacheKitCompatible { }
