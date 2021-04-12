//
//  CKMemory.swift
//  CacheKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation

public class CKMemory: NSObject {
    
    public static let shared: CKMemory = .init()
    private override init() { super.init() }
    
    private var memory: [String: Any] = [:]
    public subscript(key: CKKey) -> CKValue {
        CKValue(memory[key.value])
    }
    
    public func set(value: Any?, key: CKKey) {
        if value == nil {
            remove(key: key)
            return
        }
        memory[key.value] = value
    }
    
    public func remove(key: CKKey) {
        memory.removeValue(forKey: key.value)
    }
}
