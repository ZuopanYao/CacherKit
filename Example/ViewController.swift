//
//  ViewController.swift
//  Example
//
//  Created by Harvey on 2021/4/11.
//

import UIKit
import CacheKit

extension CKKey {
    static let mykey: CKKey = .init("mykey")
    static let mykeyData: CKKey = .init("mykeydata")
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CKKeychain.shared.set(value: ["KMGMFKDLSGH", "JGSDF"], key: .mykeyData)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            let value = CKKeychain.shared[.mykeyData]
            
            print("bool         = \(value.bool)")
            print("any          = \(value.any)")
            print("string       = \(value.string!)")
            print("stringArray  = \(value.stringArray)")
            print("int          = \(value.int)")
            print("double       = \(value.double)")
            print("float        = \(value.float)")
            print("data         = \(value.data)")
            print("dictionary   = \(value.dictionary)")
            print("number       = \(value.number)")
            print("array        = \(value.array)")
            print("url          = \(value.url)")
            print("arrayS        = \(value.array(String.self))")
        }
    }

}

