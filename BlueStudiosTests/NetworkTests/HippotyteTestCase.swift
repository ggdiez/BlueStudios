//
//  HippotyteTestCase.swift
//  BlueStudiosTests
//
//  Created by Gonzalo Gonzalez  on 10/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//


import Foundation
import XCTest
import Hippolyte

open class HyppolyteTestCase: XCTestCase {
    
    let hippolyte: Hippolyte = Hippolyte.shared
    
    override open func setUp() {
        super.setUp()
        hippolyte.start()
    }
    
    override open func tearDown() {
        hippolyte.clearStubs()
        hippolyte.stop()
        super.tearDown()
    }
    
    
    func dataFromJson(_ fileName: String) -> Data {
        
        let classBundle = Bundle(for: self.classForCoder)
        let path = classBundle.path(forResource: fileName, ofType: "json")
        
        let absolutePath =  path ?? ""
        do {
            let content = try Data(contentsOf: URL(fileURLWithPath: path!))
            return content
        } catch _ {
            print("Error trying to read file \(absolutePath). The file does not exist")
            return Data()
        }
    }
    
}
