//
//  CKMemory.swift
//  CacherKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation

public class CKMemory {
    
    private static var memory: [CKKey: Any] = [:]
    private var key: CKKey
    
    required init(key: CKKey) {
        self.key = key
    }
    
    public func remove() {
        Self.memory.removeValue(forKey: key)
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
        get { Self.memory[key] as? URL }
        set { Self.memory[key] = newValue }
    }
    
    public var bool: Bool {
        get { Self.memory[key] as? Bool ?? false }
        set { Self.memory[key] = newValue }
    }
    
    public var string: String? {
        get { Self.memory[key] as? String }
        set { Self.memory[key] = newValue }
    }
    
    public var data: Data? {
        get { Self.memory[key] as? Data }
        set { Self.memory[key] = newValue }
    }
    
    public var int: Int? {
        get { Self.memory[key] as? Int }
        set { Self.memory[key] = newValue }
    }
    
    public var float: Float? {
        get { Self.memory[key] as? Float }
        set { Self.memory[key] = newValue }
    }
    
    public var double: Double? {
        get { Self.memory[key] as? Double }
        set { Self.memory[key] = newValue }
    }
    
    public var array: [Any]? {
        get { Self.memory[key] as? [Any] }
        set { Self.memory[key] = newValue }
    }
    
    public var stringArray: [String]? {
        get { Self.memory[key] as? [String] }
        set { Self.memory[key] = newValue }
    }
    
    public var dictionary: [String: Any]? {
        get { Self.memory[key] as? [String: Any] }
        set { Self.memory[key] = newValue }
    }
    
    public func array<T>(_ Type: T.Type) -> [T]? {
        return array as? [T]
    }
}
