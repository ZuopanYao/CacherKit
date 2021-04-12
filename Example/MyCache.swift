//
//  MyCache.swift
//  Example
//
//  Created by Harvey on 2021/4/12.
//

import CacheKit

extension CKKey {
    @objc static let mykey1: CKKey = .init("mykey")
}

@objc class MyDisk: NSObject {
    
    private static let disk = CKDisk.shared
    @objc class func setValue(_ value: Any?, key: CKKey) {
        disk.set(value: value, key: key)
    }
    
    @objc class func value(key: CKKey) -> CKValue {
        return disk[key]
    }
}

@objc class MyMemory: NSObject {
    
    private static let memory = CKMemory.shared
    @objc class func setValue(_ value: Any?, key: CKKey) {
        memory.set(value: value, key: key)
    }
    
    @objc class func value(key: CKKey) -> CKValue {
        return memory[key]
    }
}

@objc class MyKeychain: NSObject {
    
    private static let keychain = CKKeychain.shared
    @objc class func setValue(_ value: Any?, key: CKKey) {
        keychain.set(value: value, key: key)
    }
    
    @objc class func value(key: CKKey) -> CKKeychainValue {
        return keychain[key]
    }
}
