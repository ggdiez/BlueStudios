//
//  StatusCode.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//


import Foundation

struct StatusCode {
    
    struct Success {
        static let ok : Int = 200
        static let created : Int = 201
        static let noContent: Int = 204
    }
    
    struct Failure {
        
        //Standard
        static let invalidRequest : Int = 400
        static let invalidCredentials : Int = 401
        static let properlyAlreadySet : Int = 403
        static let urlNotFound : Int = 404
        static let methodNotAllowed : Int = 405
        static let notAcceptable: Int = 406
        static let timeOut : Int = 408
        static let updateAplication: Int = 412
        static let expectationFailed: Int = 417
        static let serverError : Int = 500
        
        //System
        static let cancelled: Int = -999
        static let notConnectedWithServer: Int = -1009
    }
}
