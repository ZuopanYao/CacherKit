//
//  CKDisk.swift
//  CacheKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation

public class CKDisk: NSObject {
    
    @objc public static let shared: CKDisk = .init()
    private override init() { super.init() }
    
    private let disk = UserDefaults.standard
    public subscript(key: CKKey) -> CKValue {
        CKValue(disk.value(forKey: key.value))
    }
    
    public subscript<T: NSObject & NSCoding>(Base: T.Type) -> T? {
        get {
            guard let data = disk.data(forKey: "\(Base.self)") else {
                return nil
            }
            return unarchive(data) as? T
        }
        set {
            if newValue == nil {
                remove(CKKey("\(Base.self)"))
                return
            }
            disk.setValue(archived(newValue!), forKey: "\(Base.self)")
        }
    }
    
    public subscript<T: Codable>(Base: T.Type) -> T? {
        get {
            guard let data = disk.data(forKey: "\(Base.self)") else {
                return nil
            }
            
            do { return try JSONDecoder().decode(Base.self, from: data) }
            catch { CKLog(error) }
            return nil
        }
        set {
            if newValue == nil {
                remove(CKKey("\(Base.self)"))
                return
            }
            do {
                let data = try JSONEncoder().encode(newValue)
                disk.setValue(data, forKey: "\(Base.self)") }
            catch { CKLog(error) }
        }
    }
    
    @objc public func set(_ value: Any?, key: CKKey) {
        if value == nil {
            remove(key)
            return
        }
        disk.setValue(value, forKey: key.value)
    }
    
    @objc public func remove(_ key: CKKey) {
        disk.removeObject(forKey: key.value)
    }
    
    // MARK: - Additional supprt for ObjC' NSCoding
    @objc public func setCoding(_ value: Any?, key: CKKey) {
        if value == nil {
            remove(key)
            return
        }
        
        disk.setValue(archived(value!), forKey: key.value)
    }
    
    @objc public func getCoding(_ key: CKKey) -> Any? {
        guard let data = disk.data(forKey: key.value) else {
            return nil
        }
        
        return unarchive(data)
    }
    
    // MARK: - Additional supprt for ObjC get
    @objc public func value(_ key: CKKey) -> CKValue {
        return self[key]
    }
}
