//
//  CKDisk.swift
//  CacheKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation

public class CKDisk: NSObject {
    
    public static let shared: CKDisk = .init()
    private override init() { super.init() }
    
    private let disk = UserDefaults.standard
    public subscript(key: CKKey) -> CKValue {
        CKValue(disk.value(forKey: key.value))
    }
    
    public func set(value: Any?, key: CKKey) {
        if value == nil {
            remove(key: key)
            return
        }
        disk.setValue(value, forKey: key.value)
    }
    
    public func remove(key: CKKey) {
        disk.removeObject(forKey: key.value)
    }
}
