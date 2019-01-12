//
//  InterfaceLaucher.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import UIKit

final class InterfaceLauncher {
    
    static let instance = InterfaceLauncher()
    
    private var window: UIWindow!
    private var lastViewControllerActive: UIViewController!
    private var launchScreenViewController: LaunchScreenViewController!
    private var filmsViewController: FilmsViewController!
    
    private init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.launchScreenViewController = InterfaceAssemble().provideLaunchScreenViewController()
        self.filmsViewController = InterfaceAssemble().provideFilmsViewController()
    }
    
    func showLaunchScreen () {
        lastViewControllerActive = self.launchScreenViewController
        window.rootViewController = lastViewControllerActive
        window.makeKeyAndVisible()
    }
    
    func showFilmsView () {
        lastViewControllerActive = self.filmsViewController
        window.rootViewController = lastViewControllerActive
        window.makeKeyAndVisible()
    }
}
