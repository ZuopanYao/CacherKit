//
//  CKKeychain.swift
//  CacherKit
//
//  Created by Harvey on 2021/4/12.
//

import Foundation
import KeychainAccess

public class CKKeychain {
    
    static let bundleID: String = Bundle.main.infoDictionary?["CFBundleIdentifier"] as! String
    static let keychain: Keychain = {
        return Keychain(service: "\(bundleID).CacherKit.Keychain")
    }()
    
    private var key: CKKey
    
    required init<K: CKKey>(key: K) {
        self.key = key
    }
    
    public func remove() {
        do {
            try Self.keychain.remove(key.rawValue)
        } catch {
            echo(error)
        }
    }
}

extension CKKey {
    
    /// 保存到钥匙串
    public var keychain: CKKeychain {
        return .init(key: self)
    }
}

extension CKKeychain: CKCacheProtocol {
    
    public var url: URL? {
        get {
            guard let string = string else { return nil }
            return URL(string: string)
        }
        set {
            guard let newValue = newValue else { return remove() }
            string = newValue.absoluteString
        }
    }
    
    public var bool: Bool {
        get { string == "true" }
        set { string = "\(newValue)" }
    }
    
    public var string: String? {
        get { Self.keychain[key.rawValue] }
        set {
            guard let newValue = newValue else { return remove() }
            Self.keychain[key.rawValue] = newValue
        }
    }
    
    public var data: Data? {
        get { Self.keychain[data: key.rawValue] }
        set {
            guard let newValue = newValue else { return remove() }
            Self.keychain[data: key.rawValue] = newValue
        }
    }
    
    public var int: Int {
        get {
            return Int(double)
        }
        set {
            double = Double(newValue)
        }
    }
    
    public var float: Float {
        get {
            return Float(double)
        }
        set {
            double = Double(newValue)
        }
    }
    
    public var double: Double {
        get {
            guard let string = string else { return 0.0 }
            return Double(string) ?? 0.0
        }
        set {
            Self.keychain[key.rawValue] = "\(newValue)"
        }
    }
    
    public var array: [Any]? {
        get {
            echo("Keychain not supprt array get, please use array<T>")
            return nil
        }
        set { echo("Keychain not supprt array set") }
    }
    
    public var stringArray: [String]? {
        get {
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
        set {
            guard let newValue = newValue else { return remove() }
            string = "\(newValue)"
        }
    }
    
    public var dictionary: [String: Any]? {
        get {
            echo("Keychain not supprt dictionary get")
            return nil
        }
        set { echo("Keychain not supprt dictionary set") }
    }
    
    /// Only [Double]、[Float]、[Int]、[String]
    public func array<T>(_ Type: T.Type) -> [T]? {
        guard let array = stringArray else { return nil }
        if Type == String.self { return array as? [T] }
        let arrayDouble = array.compactMap { Double($0) }
        if Type == Double.self { return arrayDouble as? [T] }
        if Type == Float.self { return arrayDouble.compactMap({ Float($0) }) as? [T] }
        if Type == Int.self { return arrayDouble.compactMap({ Int($0) }) as? [T] }
        return nil
    }
}
