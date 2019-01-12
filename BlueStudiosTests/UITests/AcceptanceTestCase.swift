//
//  AcceptanceTestCase.swift
//  BlueStudiosTests
//
//  Created by Gonzalo Gonzalez  on 10/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import KIF

class AcceptanceTestCase: KIFTestCase {
    
    fileprivate var originalRootViewController: UIViewController?
    fileprivate var rootViewController: UIViewController? {
        get {
            return UIApplication.shared.keyWindow?.rootViewController
        }
        
        set(newRootViewController) {
            UIApplication.shared.keyWindow?.rootViewController = newRootViewController
        }
    }
    
    override func tearDown() {
        super.tearDown()
        if let originalRootViewController = originalRootViewController {
            rootViewController = originalRootViewController
        }
    }
    
    func present(viewController: UIViewController) {
        originalRootViewController = rootViewController
        rootViewController = viewController
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
