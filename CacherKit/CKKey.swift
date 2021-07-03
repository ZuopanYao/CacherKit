//
//  CKKey.swift
//  CacherKit
//
//  Created by Harvey on 2019/6/5.
//  Copyright © 2019 姚作潘/Harvey. All rights reserved.
//

import Foundation

public protocol CKKey {
    var rawValue: String { get }
    init?(rawValue: String)
}
