//
//  CKKeychain.swift
//  CacheKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation
import KeychainAccess

public class CKKeychain: NSObject {
    
    var bundleID: String {
        Bundle.main.infoDictionary?["CFBundleIdentifier"] as! String
    }
    public static let shared: CKKeychain = .init()
    private override init() { super.init() }
    
    lazy var keychain: Keychain = {
        return Keychain(service: "\(bundleID).CacheKit.Keychain")
    }()
    
    public subscript(key: CKKey) -> CKValue {
        return CKKeychainValue(keychain[key.value])
    }
    
    /// Only Int、Double、Float、String、Data
    public func set(value: Any?, key: CKKey) {
        if value == nil {
            remove(key: key)
            return
        }
        guard let data = value as? Data else {
            keychain[key.value] = "\(value!)"
            return
        }
        keychain[data: key.value] = data
    }
    
    public func remove(key: CKKey) {
        do {
            try keychain.remove(key.value)
        } catch { CKLog(error) }
    }
}

public class CKKeychainValue: CKValue {
    
    public override var int: Int? {
        guard let double = double else { return nil }
        return Int(double)
    }
    
    public override var float: Float? {
        guard let double = double else { return nil }
        return Float(double)
    }
    
    public override var double: Double? {
        guard let string = string else { return nil }
        return Double(string)
    }
    
    public override var data: Data? {
        guard let string = string else { return nil }
        return string.data(using: .utf8)
    }
    
    public override var stringArray: [String]? {
        Array.ini
        return nil
    }
}
