//
//  CKCodable.swift
//  CacherKit
//
//  Created by Harvey on 2021/5/25.
//

import Foundation

// MARK: - Extension Codable
private let cachers: [CKCacheProtocol.Type] = [CKDisk.self, CKMemory.self, CKKeychain.self]

public enum CKCache: Int {
    case disk = 0
    case memory = 1
    case keychain = 2
}

extension Encodable {
       
    /// JSON encode 后保存
    public func encode(to: CKCache) {
        do {
            let key = CKKey("\(Self.self)")
            let data = try JSONEncoder().encode(self)
            var cacher = cachers[to.rawValue].init(key: key)
            cacher.data = data
        } catch { echo(error) }
    }
}

extension Decodable {
    
    /// 从缓存取出进行 JSON decode
    public static func decode(from: CKCache) -> Self? {
        do {
            let key = CKKey("\(Self.self)")
            guard let data = cachers[from.rawValue].init(key: key).data else { return nil }
            return try JSONDecoder().decode(Self.self, from: data)
        } catch { echo(error) }
        return nil
    }
    
    /// 从缓存中删除
    public static func remove(from: CKCache) {
        let key = CKKey("\(Self.self)")
        cachers[from.rawValue].init(key: key).remove()
    }
}
