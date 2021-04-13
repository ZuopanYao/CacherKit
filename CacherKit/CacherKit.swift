//
//  CacherKit.swift
//  CacherKit
//
//  Created by Harvey on 2019/6/5.
//  Copyright © 2019 姚作潘/Harvey. All rights reserved.
//

import Foundation

public class CKKey: NSObject {
        
    var value: String
    public init(_ value: String) {
        self.value = value
    }
}

/// CacherKit
public struct CK {
    
    /// 高速缓存，app重启或崩溃数据将丢失
    public static let memory = CKMemory.shared
    
    /// 持久性缓存
    public static let disk = CKDisk.shared
    
    /// 钥匙串访问
    public static let keychain = CKKeychain.shared
}

// MARK: -  归档
func archived(_ base: Any) -> Data {
    return NSKeyedArchiver.archivedData(withRootObject: base)
}

// 解档
func unarchive(_ data: Data) -> Any? {
    return NSKeyedUnarchiver.unarchiveObject(with: data)
}

