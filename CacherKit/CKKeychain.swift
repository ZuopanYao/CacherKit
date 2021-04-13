//
//  CKKeychain.swift
//  CacherKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation
import KeychainAccess

public class CKKeychain: NSObject {
    
    var bundleID: String {
        Bundle.main.infoDictionary?["CFBundleIdentifier"] as! String
    }
    @objc public static let shared: CKKeychain = .init()
    private override init() { super.init() }
    
    lazy var keychain: Keychain = {
        return Keychain(service: "\(bundleID).CacherKit.Keychain")
    }()
    
    public subscript(key: CKKey) -> CKKeychainValue {
        
        guard let value = keychain[key.value] else {
            return CKKeychainValue(keychain[data: key.value])
        }
        return CKKeychainValue(value)
    }
    
    public subscript<T: NSObject & NSCoding>(Base: T.Type) -> T? {
        get {
            guard let data = keychain[data: "\(Base.self)"] else {
                return nil
            }
            return unarchive(data) as? T
        }
        set {
            if newValue == nil {
                remove(CKKey("\(Base.self)"))
                return
            }
            keychain[data: "\(Base.self)"] = archived(newValue!)
        }
    }
    
    public subscript<T: Codable>(Base: T.Type) -> T? {
        get {
            guard let data = keychain[data: "\(Base.self)"] else {
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
                keychain[data: "\(Base.self)"] = data }
            catch { CKLog(error) }
        }
    }
    
    /// Only Int、Double、Float、String、Data、[Int]、[Double]、[Float]、[String]
    @objc public func set(_ value: Any?, key: CKKey) {
        if value == nil {
            remove(key)
            return
        }
        guard let data = value as? Data else {
            keychain[key.value] = "\(value!)"
            return
        }
        keychain[data: key.value] = data
    }
    
    @objc public func remove(_ key: CKKey) {
        do {
            try keychain.remove(key.value)
        } catch { CKLog(error) }
    }
    
    // MARK: - Additional supprt for ObjC' NSCoding
    @objc public func setCoding(_ value: Any?, key: CKKey) {
        if value == nil {
            remove(key)
            return
        }
        
        keychain[data: key.value] = archived(value!)
    }
    
    @objc public func getCoding(_ key: CKKey) -> Any? {
        guard let data = keychain[data: key.value] else {
            return nil
        }
        
        return unarchive(data)
    }
    
    // MARK: - Additional supprt for ObjC get
    @objc public func value(_ key: CKKey) -> CKKeychainValue {
        return self[key]
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
        guard let string = string else { return base as? Data }
        return string.data(using: .utf8)
    }
    
    public override var stringArray: [String]? {
        
        guard let string = string else {
            return nil
        }
        
        guard string.contains("[") else {
            return [string]
        }
        
        var offsetCount = 1
        var separated = ", "
        
        if string.hasPrefix("[\"") {
            offsetCount = 2
            separated = "\", \""
        }
        
        let startIndex = string.index(string.startIndex, offsetBy: offsetCount)
        let endIndex = string.index(string.endIndex, offsetBy: -offsetCount)
        let subString = string[startIndex..<endIndex]
        
        return "\(subString)".components(separatedBy: separated)
    }
    
    /// Only [Int]、[Double]、 [Float]、[String]
    public override func array<T>(_ Base: T.Type) -> [T]? {
        
        guard let datas = stringArray else {
            return nil
        }
        
        if Base == String.self {
            return datas as? [T]
        }
        
        let arrayDouble = datas.compactMap { Double($0) }
        if Base == Double.self {
            return arrayDouble as? [T]
        }
        
        if Base == Float.self {
            return arrayDouble.map { Float($0) } as? [T]
        }
        
        if Base == Int.self {
            return arrayDouble.map { Int($0) } as? [T]
        }
        return nil
    }
    
    public override var number: NSNumber? {
        guard let double = double else {
            return nil
        }
        return NSNumber(value: double)
    }
}
