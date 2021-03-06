//
//  ViewController.swift
//  Example
//
//  Created by Harvey on 2021/4/11.
//

import UIKit
import CacherKit


//class MyModel: NSObject, NSCoding {
//
//    var name: String = "name"
//    var age: Int = 100
//
//    override init() {
//        super.init()
//    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(name, forKey: "name")
//        coder.encodeCInt(Int32(age), forKey: "age")
//    }
//
//    required init?(coder: NSCoder) {
//        name = coder.decodeObject(forKey: "name") as! String
//        age = coder.decodeInteger(forKey: "age")
//    }
//}

class MyModel: Codable {
    var name: String = "klsfkdslfk"
    var age: Int = 999
}

enum MyKey: String, CKKey {
    case test
    case two
}

/// Must be codabl
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            MyKey.test.disk.string = "diskString"
            usleep(useconds_t(0.3 * 1000000.0))
            print(MyKey.test.disk.string!)
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            MyKey.test.memory.string = "memoryString"
            usleep(useconds_t(0.3 * 1000000.0))
            print(MyKey.test.memory.string!)
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
            MyKey.test.keychain.string = "keychainString"
            usleep(useconds_t(0.3 * 1000000.0))
            print(MyKey.test.keychain.string!)
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 4.0) {
            let model = MyModel()
            model.encode(to: .keychain)
            usleep(useconds_t(0.3 * 1000000.0))
            
            let instance = MyModel.decode(from: .keychain)!
            print(instance.age, instance.name)
        }
        
        
        //MyKey(rawValue: "kk")

        ////        let bool:  = DiskCache.shared[.mykey].
//
//        var model = MyModel()
//        model.name = "gkesljagtmkleww"
//        model.encode(to: .disk)
//
////
//        //CKKey.mykey.keychain.array = [12.8, 13.88, 15.888]
//
//        let path =  Bundle.main.path(forResource: "Info", ofType: "plist")
//        print(path)
//        CKKey.fileURL.keychain.url = URL(fileURLWithPath: path!)
//        CKKey.url.keychain.url = URL(string: "https://www.baidu.com")
//        CKKey.mykey.disk.remove()
//
//        let diskString = CKKey.mykey.disk.string
//        let keychainString = CKKey.mykey.keychain.string
//        let memoryString = CKKey.mykey.memory.string
//
//        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2.0) {
//            print( CKKey.fileURL.keychain.url,  CKKey.url.keychain.url)
//        }
//
        /// save
        let model = MyModel()
        model.encode(to: .disk)
        model.encode(to: .keychain)
        model.encode(to: .memory)
        
        /// Read
        let instanceFromDisk: MyModel? = MyModel.decode(from: .disk)
        let instanceFromKeychain: MyModel? = MyModel.decode(from: .keychain)
        let instanceFromMemory: MyModel? = MyModel.decode(from: .memory)

        
        MyModel.remove(from: .disk)
        //CKKey.mykey1.disk.bool = false
//
//        /// Saving to disk (With UserDefaults)
//        CK.disk[ModelObject.self] = model
//
//        /// Saving to memory
//        CK.memory[ModelObject.self] = model
//
//        /// Saving to keychain
//        CK.keychain[ModelObject.self] = model
//
//        /// Obtaining
//        let redadModel1 = CK.disk[MyModel.self]
//        let redadModel2 = CK.memory[MyModel.self]
//        let redadModel3 = CK.keychain[MyModel.self]
//
//        /// Removing
//        CK.disk[MyModel.self] = nil
//        CK.memory[MyModel.self] = nil
//        CK.keychain[MyModel.self] = nil
    }
    
     func viewDidLoad111() {
        // Do any additional setup after loading the view.
        
//        // MARK: - Adding an item ---------------------
//        /// Saving to disk (With UserDefaults)
//        CK.disk.set("TestString", key: .mykey)
//
//        /// Saving to memory
//        CK.memory.set("TestString", key: .mykey)
//
//        /// Saving to keychain
//        CK.keychain.set("TestString", key: .mykey)
//
//        // MARK: - Obtaining an item ---------------------
//        //let value = CK.disk[.mykey]
//        //let value = CK.keychain[.mykey]
//        let value = CK.memory[.mykey]
//
//        // Convert to String
//        let str = value.string
//        // Convert to Data
//        let data = value.data
//
//        // and so on
//
//        // MARK: - Removing item ---------------------
//        /// Removing from disk (With UserDefaults)
//        CK.disk.set(nil, key: .mykey)
//
//        /// Removing from memory
//        CK.memory.set(nil, key: .mykey)
//
//        /// Removing from keychain
//        CK.keychain.set(nil, key: .mykey)
//
//
//        // MARK: - Remove methhod ---------------------
//        /// Removing from disk (With UserDefaults)
//        CK.disk.remove(.mykey)
//
//        /// Removing from memory
//        CK.memory.remove(.mykey)
//
//        /// Removing from keychain
//        CK.keychain.remove(.mykey)
//
//        let t = Test()
//        t.age = 8
//        t.name = "1111111gamklg"
//
//
//        let test = SwiftTest()
//        //let data = t.ck.archived()
//
//        //print(data)
//        //CKMemory.shared[SwiftTest.self] = test
//        CKKeychain.shared.set(1334, key: CKKey.mykey1)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//
//            let value = CKKeychain.shared[.mykey1] //CKKeychain.shared[.test]
//            //let test = Test.ck.unarchive(value.data!)
//            //print("\(test?.name) -- \(test?.age)")
//            print("bool         = \(value.bool)")
//            print("any          = \(value.any)")
//            print("string       = \(value.string)")
//            print("stringArray  = \(value.stringArray)")
//            print("int          = \(value.int)")
//            print("double       = \(value.double)")
//            print("float        = \(value.float)")
//            print("data         = \(value.data)")
//            print("dictionary   = \(value.dictionary)")
//            print("number       = \(value.number)")
//            print("array        = \(value.array(Int.self))")
//            print("url          = \(value.url)")
//            print("arrayS       = \(value.array(String.self))")
//
//            print("arrayDouble  = \(value.array(Double.self))")
//            print("arrayFloat   = \(value.array(Float.self))")
//            print("arrayInt     = \(value.array(Int.self))")
//            print("arrayString  = \(value.array(String.self))")
//
//
//        }
    }

}

