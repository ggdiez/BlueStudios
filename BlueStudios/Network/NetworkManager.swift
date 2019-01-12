//
//  NetworkManager.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    static let instance = NetworkManager()
    
    let alamofireManager: SessionManager!
    
    init(){
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Server.timeout
        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
}
