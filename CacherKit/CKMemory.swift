//
//  CKMemory.swift
//  CacherKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation

public class CKMemory: NSObject {
    
    @objc public static let shared: CKMemory = .init()
    private override init() { super.init() }
    
    private var memory: [String: Any] = [:]
    public subscript(key: CKKey) -> CKValue {
        CKValue(memory[key.value])
    }
    
    public subscript<T: NSObject & NSCoding>(Base: T.Type) -> T? {
        get { memory["\(Base.self)"] as? T }
        set {
            if newValue == nil {
                remove(CKKey("\(Base.self)"))
                return
            }
            memory["\(Base.self)"] = newValue
        }
    }
    
    public subscript<T: Codable>(Base: T.Type) -> T? {
        get { memory["\(Base.self)"] as? T }
        set {
            if newValue == nil {
                remove(CKKey("\(Base.self)"))
                return
            }
            memory["\(Base.self)"] = newValue
        }
    }
    
    @objc public func set(_ value: Any?, key: CKKey) {
        if value == nil {
            remove(key)
            return
        }
        memory[key.value] = value
    }
    
    @objc public func remove(_ key: CKKey) {
        memory.removeValue(forKey: key.value)
    }
    
    // MARK: - Additional supprt for ObjC get
    @objc public func value(_ key: CKKey) -> CKValue {
        return self[key]
    }
}
