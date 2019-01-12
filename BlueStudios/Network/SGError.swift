//
//  SGError.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

enum SGError : Error {
    
    case unknownError
    case invalidRequest
    case invalidCredentials
    case properlyAlreadySet
    case urlNotFound
    case notAcceptable
    case timeOut
    case serverError
    case userNeedsValidation
    case appNeedsUpdate
    case serverReturnIncompleteData
    case parametersWrong
    case valueIsBelowMinimun
    case notConnectedWithServer
    case expectationFailed
    case customError
    
    static func checkErrorCode(_ errorCode: Int) -> SGError {
        switch errorCode {
        case StatusCode.Failure.invalidRequest:
            return .invalidRequest
        case StatusCode.Failure.invalidCredentials:
            return .invalidCredentials
        case StatusCode.Failure.properlyAlreadySet:
            return .properlyAlreadySet
        case StatusCode.Failure.urlNotFound:
            return .urlNotFound
        case StatusCode.Failure.timeOut:
            return .timeOut
        case StatusCode.Failure.serverError:
            return .serverError
        case StatusCode.Failure.cancelled:
            return .invalidCredentials
        case StatusCode.Failure.updateAplication:
            return .appNeedsUpdate
        case StatusCode.Failure.notConnectedWithServer:
            return .notConnectedWithServer
        case StatusCode.Failure.expectationFailed:
            return .expectationFailed
        case StatusCode.Failure.notAcceptable:
            return .notAcceptable
        default:
            return .unknownError
        }
    }
}


