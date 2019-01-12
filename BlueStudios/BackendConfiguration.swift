//
//  BackendConfiguration.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

struct Environment {
    static let isMock: Bool = true
}

struct Server {
    static let url: String = "https://bluestudios_backend.com"
    static let timeout: Double = 30.0
}

struct EndPoints {
    static let films = "/films/"
}

struct Parameters {
    static let filmID = "_id"
    static let filmStatus = "status"
}


