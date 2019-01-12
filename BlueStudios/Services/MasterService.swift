//
//  MasterService.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

final class MasterService {
    static let instance = MasterService()
    
    private init () {}
    
    //MARK: - Support for Unit Tests
    func isTestEnvirontment () -> Bool {
        let dic = ProcessInfo.processInfo.environment
        return dic["TEST"] != nil ? true : false
    }
    
    //MARK: - Services
    
    func getFilmService () -> FilmService {
        if Environment.isMock {
            return FilmService.mockInstance
        } else {
            return FilmService.instance
        }
    }
    
}
