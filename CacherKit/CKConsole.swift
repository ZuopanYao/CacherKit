//
//  CKConsole.swift
//  CacherKit
//
//  Created by Harvey on 2019/6/10.
//  Copyright © 2019 姚作潘/Harvey. All rights reserved.
//

import Foundation

class CKConsole {
    
    static let shared = CKConsole()
    private init() {
        
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }
    
    let formatter: DateFormatter
    var dateString: String { formatter.string(from: Date()) }
}

/// CacherKit 自定义打印函数
func CKLog(_ items: Any..., file: String = #file, method: String = #function, line: Int = #line) {
    
    var string = "[CacherKit] \(CKConsole.shared.dateString) in \(file.split(separator: "/").last!) \(method) [Line \(line)]:\n"
    print(string, terminator: "")
    
    for item in items {
        
        print(item)
        string = string + "\(item)\n"
    }
    print("")
}
