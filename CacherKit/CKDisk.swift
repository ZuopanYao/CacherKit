//
//  CKDisk.swift
//  CacherKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation

public class CKDisk {

    private let disk = UserDefaults.standard
    private var key: CKKey
    
    required init<K: CKKey>(key: K) {
        self.key = key
    }
    
    public func remove() {
        disk.removeObject(forKey: key.rawValue)
    }
}

extension CKKey {
    
    /// 持久性缓存 (UserDefaults)
    public var disk: CKDisk {
        return .init(key: self)
    }
}

extension CKDisk: CKCacheProtocol {
    
    public var url: URL? {
        get { disk.url(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var bool: Bool {
        get { disk.bool(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var string: String? {
        get { disk.string(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var data: Data? {
        get { disk.data(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var int: Int {
        get { disk.integer(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var float: Float {
        get { disk.float(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var double: Double {
        get { disk.double(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var array: [Any]? {
        get { disk.array(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var stringArray: [String]? {
        get { disk.stringArray(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public var dictionary: [String: Any]? {
        get { disk.dictionary(forKey: key.rawValue) }
        set { disk.set(newValue, forKey: key.rawValue) }
    }
    
    public func array<T>(_ Type: T.Type) -> [T]? {
        return array as? [T]
    }
}
