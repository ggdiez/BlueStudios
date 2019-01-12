//
//  MockAPIProtocol.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

protocol MockAPIProtocol {
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ())
    func fromJsonFile(_ fileName: String) -> NSString
}

extension MockAPIProtocol {
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    func fromJsonFile(_ fileName: String) -> NSString {
        
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        let absolutePath =  path ?? ""
        do {
            let content = try String(contentsOfFile: absolutePath, encoding: String.Encoding.utf8)
            if content.last == "\n"{
                return NSString(string: content.substring(to: content.index(before: content.endIndex)))
            } else {
                return NSString(string: content)
            }
        } catch _ {
            print("Error trying to read file \(absolutePath). The file does not exist")
            return NSString(string: "")
        }
    }
}

