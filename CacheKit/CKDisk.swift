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
    
    public subscript<T: NSObject & NSCoding>(Base: T.Type) -> T? {
        get {
            guard let data = disk.data(forKey: "\(Base.self)") else {
                return nil
            }
            return T.ck.unarchive(data)
        }
        set {
            if newValue == nil {
                remove(key: CKKey("\(Base.self)"))
                return
            }
            disk.setValue(newValue?.ck.archived(), forKey: "\(Base.self)")
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
                remove(key: CKKey("\(Base.self)"))
                return
            }
            do {
                let data = try JSONEncoder().encode(newValue)
                disk.setValue(data, forKey: "\(Base.self)") }
            catch { CKLog(error) }
        }
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
