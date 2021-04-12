//
//  CKObject.swift
//  CacheKit
//
//  Created by Harvey on 2019/6/6.
//  Copyright © 2019 姚作潘/Harvey. All rights reserved.
//

import Foundation

public extension CacheKit where Base: Codable {
    
    static func fromJSON(data: Data? = nil, string: String? = nil) -> Base? {
        
        if let _ = data, let _ = string {
            return nil
        }
        
        var _data: Data!
        if let _ = data {
            _data = data!
        }
        
        if let _ = string {
            _data = string!.data(using: .utf8)
        }
        
        do { return try JSONDecoder().decode(Base.self, from: _data) }
        catch { CKLog(error) }
        return nil
    }
    
    func json(_ encoding: String.Encoding = .utf8) -> (data: Data, string: String)? {
        
        do {
            let data = try JSONEncoder().encode(self.base)
            
            return (data, String(data: data, encoding: .utf8)!)
        } catch {
            CKLog(error)
        }
        return nil
    }
}
