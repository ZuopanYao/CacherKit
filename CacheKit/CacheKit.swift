//
//  CacheKit.swift
//  CacheKit
//
//  Created by Harvey on 2019/6/5.
//  Copyright © 2019 姚作潘/Harvey. All rights reserved.
//

import Foundation

public class CKKey: NSObject {
        
    var value: String
    public init(_ value: String) {
        self.value = value
    }
}

/// CacheKit
public struct CK {
    
    /// 高速缓存，app重启或崩溃数据将丢失
    public static let memory = CKMemory.shared
    
    /// 持久性缓存
    public static let disk = CKDisk.shared
    
    /// 钥匙串访问
    public static let keychain = CKKeychain.shared
}

public struct CacheKit<Base> {
    
    var base: Base
    fileprivate init(_ base: Base) {
        self.base = base
    }    
}

public protocol CacheKitCompatible {
    
    associatedtype CompatibleType
    
    var ck: CacheKit<CompatibleType> { get }
    static var ck: CacheKit<CompatibleType>.Type { get }
}

public extension CacheKitCompatible {
    
    var ck: CacheKit<Self> {
        get { return CacheKit(self) }
    }
    
    static var ck: CacheKit<Self>.Type {
        get { return CacheKit<Self>.self }
    }
}

extension NSObject: CacheKitCompatible { }
