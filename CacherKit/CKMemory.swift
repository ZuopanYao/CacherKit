//
//  CKMemory.swift
//  CacherKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation

public class CKMemory {
    
    private static var memory: [String: Any] = [:]
    private var key: CKKey
    
    required init<K: CKKey>(key: K) {
        self.key = key
    }
    
    public func remove() {
        Self.memory.removeValue(forKey: key.rawValue)
    }
}

extension CKKey {
    
    /// 高速缓存，app重启或崩溃数据将丢失
    public var memory: CKMemory {
        return .init(key: self)
    }
}

extension CKMemory: CKCacheProtocol {
    
    public var url: URL? {
        get { Self.memory[key.rawValue] as? URL }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var bool: Bool {
        get { Self.memory[key.rawValue] as? Bool ?? false }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var string: String? {
        get { Self.memory[key.rawValue] as? String }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var data: Data? {
        get { Self.memory[key.rawValue] as? Data }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var int: Int {
        get { Self.memory[key.rawValue] as? Int ?? 0 }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var float: Float {
        get { Self.memory[key.rawValue] as? Float ?? 0.0 }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var double: Double {
        get { Self.memory[key.rawValue] as? Double ?? 0.0 }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var array: [Any]? {
        get { Self.memory[key.rawValue] as? [Any] }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var stringArray: [String]? {
        get { Self.memory[key.rawValue] as? [String] }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public var dictionary: [String: Any]? {
        get { Self.memory[key.rawValue] as? [String: Any] }
        set { Self.memory[key.rawValue] = newValue }
    }
    
    public func array<T>(_ Type: T.Type) -> [T]? {
        return array as? [T]
    }
}
