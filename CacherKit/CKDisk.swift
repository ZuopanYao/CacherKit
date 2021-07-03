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
    
    required init(key: CKKey) {
        self.key = key
    }
    
    public func remove() {
        disk.removeObject(forKey: key.value)
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
        get { disk.url(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var bool: Bool {
        get { disk.bool(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var string: String? {
        get { disk.string(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var data: Data? {
        get { disk.data(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var int: Int {
        get { disk.integer(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var float: Float {
        get { disk.float(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var double: Double {
        get { disk.double(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var array: [Any]? {
        get { disk.array(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var stringArray: [String]? {
        get { disk.stringArray(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public var dictionary: [String: Any]? {
        get { disk.dictionary(forKey: key.value) }
        set { disk.set(newValue, forKey: key.value) }
    }
    
    public func array<T>(_ Type: T.Type) -> [T]? {
        return array as? [T]
    }
}
