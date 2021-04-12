//
//  ViewController.swift
//  Example
//
//  Created by Harvey on 2021/4/11.
//

import UIKit
import CacheKit

class Test: NSObject, NSCoding {
    
    var name: String = "name"
    var age: Int = 100
    
    override init() {
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encodeCInt(Int32(age), forKey: "age")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        age = coder.decodeInteger(forKey: "age")
    }
}

extension CKKey {
    static let mykey: CKKey = .init("mykey")
    static let mykeyData: CKKey = .init("mykeydata")
    static let test: CKKey = .init("Test")
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let t = Test()
        t.age = 88
        t.name = "kgamklg"
        
        let data = t.ck.archived()
        
        print(data)
        CKKeychain.shared.set(value: data, key: .test)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            let value = CKKeychain.shared[.test]
            let test = Test.ck.unarchive(value.data!)
            print("\(test?.name) -- \(test?.age)")
            print("bool         = \(value.bool)")
            print("any          = \(value.any)")
            print("string       = \(value.string)")
            print("stringArray  = \(value.stringArray)")
            print("int          = \(value.int)")
            print("double       = \(value.double)")
            print("float        = \(value.float)")
            print("data         = \(value.data)")
            print("dictionary   = \(value.dictionary)")
            print("number       = \(value.number)")
            print("array        = \(value.array(Int.self))")
            print("url          = \(value.url)")
            print("arrayS       = \(value.array(String.self))")
            
            print("arrayDouble  = \(value.array(Double.self))")
            print("arrayFloat   = \(value.array(Float.self))")
            print("arrayInt     = \(value.array(Int.self))")
            print("arrayString  = \(value.array(String.self))")


        }
    }

}

