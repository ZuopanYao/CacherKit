//
//  CKObject.swift
//  CacheKit
//
//  Created by Harvey on 2019/6/6.
//  Copyright © 2019 姚作潘/Harvey. All rights reserved.
//

import Foundation

public extension CacheKit where Base: NSObject & NSCoding {
    
    /// 归档
    func archived() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: base)
    }
    
    static func unarchive(_ data: Data) -> Base? {
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? Base
    }
}
