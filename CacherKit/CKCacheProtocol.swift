//
//  CKCacheProtocol.swift
//  CacherKit
//
//  Created by Harvey on 2021/5/25.
//

import Foundation

protocol CKCacheProtocol {
 
    init(key: CKKey)
    func remove()
    func array<T>(_ Type: T.Type) -> [T]?
    
    var url: URL? { get set }
    /// If the key doesn‘t exist, this method returns 0.
    var int: Int { get set }
    /// If the key doesn‘t exist, this method returns false.
    var bool: Bool { get set }
    var data: Data? { get set }
    /// If the key doesn‘t exist, this method returns 0.0.
    var float: Float { get set }
    var array: [Any]? { get set }
    var string: String? { get set }
    /// If the key doesn‘t exist, this method returns 0.0.
    var double: Double { get set }
    var stringArray: [String]? { get set }
    var dictionary: [String: Any]? { get set }
}
