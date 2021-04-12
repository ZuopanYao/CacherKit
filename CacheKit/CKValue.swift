//
//  CKValue.swift
//  CacheKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation

public class CKValue: NSObject {
    
    var base: Any?
    convenience init(_ base: Any?) {
        self.init()
        self.base = base
    }
    
    @objc public var any: Any? {
        return base
    }
    
    @objc public var url: URL? {
        return URL(string: base as? String ?? "")
    }
    
    @objc public var bool: Bool {
        return base as? Bool ?? false
    }
    
    @objc public var string: String? {
        return base as? String
    }
    
    @objc public var array: [Any]? {
        return base as? [Any]
    }
    
    @objc public var stringArray: [String]? {
        return base as? [String]
    }
    
    @objc public var dictionary: [String: Any]? {
        return base as? [String: Any]
    }
    
    @objc public var data: Data? {
        return base as? Data
    }
    
    // MARK: - Only OC
    @objc public var number: NSNumber? {
        return base as? NSNumber
    }
    
    // MARK: - Only Swift
    public var int: Int? {
        return base as? Int
    }
    
    public var float: Float? {
        return base as? Float
    }
    
    public var double: Double? {
        return base as? Double
    }
    
    // MARK: - Method
    public func any<T>(_ Base: T.Type) -> T? {
        return base as? T
    }
    
    public func array<T>(_ Base: T.Type) -> [T]? {
       return base as? [T]
    }
}
