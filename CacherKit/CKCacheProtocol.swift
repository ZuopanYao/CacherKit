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
    var int: Int? { get set }
    var bool: Bool { get set }
    var data: Data? { get set }
    var float: Float? { get set }
    var array: [Any]? { get set }
    var string: String? { get set }
    var double: Double? { get set }
    var stringArray: [String]? { get set }
    var dictionary: [String: Any]? { get set }
}
