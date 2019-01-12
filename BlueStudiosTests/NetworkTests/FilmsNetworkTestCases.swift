//
//  FilmsNetworkTestCases.swift
//  BlueStudiosTests
//
//  Created by Gonzalo Gonzalez  on 10/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import Nimble
import XCTest
import Hippolyte
@testable import BlueStudios

class FilmsNetworkTestCases: HyppolyteTestCase {
    
    let timeout = 5.0
    
    let url = Server.url + EndPoints.films
    
    let filmNetwork: FilmNetwork = FilmNetwork()
    
    override open func setUp() {
        super.setUp()
    }
    
    override open func tearDown() {
        super.tearDown()
    }
    
    fileprivate func stubGetFilms (expectedHTTPReturnCode: Int, bodyResponseJsonFile: String?) {
        
        var response: StubResponse!
    
        if let body: String = bodyResponseJsonFile {
            response = StubResponse.Builder().stubResponse(withStatusCode: expectedHTTPReturnCode).addBody(dataFromJson(body)).build()
        } else {
            response = StubResponse.Builder().stubResponse(withStatusCode: expectedHTTPReturnCode).build()
        }
        
        let request = StubRequest.Builder().stubRequest(withMethod: .GET, url: URL(string: url)!).addResponse(response).build()
        Hippolyte.shared.add(stubbedRequest: request)
    }
    
    fileprivate func stubChangeStatus (expectedHTTPReturnCode: Int, bodyResponseJsonFile: String?) {
        
        var response: StubResponse!
        
        if let body: String = bodyResponseJsonFile {
            response = StubResponse.Builder().stubResponse(withStatusCode: expectedHTTPReturnCode).addBody(dataFromJson(body)).build()
        } else {
            response = StubResponse.Builder().stubResponse(withStatusCode: expectedHTTPReturnCode).build()
        }
        
        let request = StubRequest.Builder().stubRequest(withMethod: .POST, url: URL(string: url)!).addResponse(response).build()
        Hippolyte.shared.add(stubbedRequest: request)
    }
    
    func testShouldReturnOkWhenGetFilmsHTTPCodeReturnIsSuccess() {
        let expectedReturn = 200
        var isSuccess: Bool!
        
        stubGetFilms(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: "getFilms")
        
        filmNetwork.getFilms(onSuccess: { (result) in
            isSuccess = true
        }) { (error) in
            isSuccess = false
        }
        
        expect(isSuccess).toEventually(equal(true), timeout:timeout)
    }

    func testShouldReturnFailWhenGetFilmsHTTPCodeReturnInvalidRequestCode() {
        let expectedReturn = 400
        var sgError: SGError!
        let expectedError: SGError = SGError.invalidRequest
        
        stubGetFilms(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.getFilms(onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    func testShouldReturnFailWhenGetFilmsHTTPCodeReturnInvalidCredentials() {
        let expectedReturn = 401
        var sgError: SGError!
        let expectedError: SGError = SGError.invalidCredentials
        
        stubGetFilms(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.getFilms(onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    func testShouldReturnFailWhenGetFilmsHTTPCodeReturnPropertyAlreadySet() {
        let expectedReturn = 403
        var sgError: SGError!
        let expectedError: SGError = SGError.properlyAlreadySet
        
        stubGetFilms(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.getFilms(onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    func testShouldReturnFailWhenGetFilmsHTTPCodeReturnNotFound() {
        let expectedReturn = 404
        var sgError: SGError!
        let expectedError: SGError = SGError.urlNotFound
        
        stubGetFilms(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.getFilms(onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    func testShouldReturnFailWhenGetFilmsHTTPCodeReturnServerError () {
        let expectedReturn = 500
        var sgError: SGError!
        let expectedError: SGError = SGError.serverError
        
        stubGetFilms(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.getFilms(onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    func testShouldReturnFailWhenGetFilmsHTTPCodeReturnUnknowmError () {
        let expectedReturn = 9999999
        var sgError: SGError!
        let expectedError: SGError = SGError.unknownError
        
        stubGetFilms(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.getFilms(onSuccess: { (result) in
            sgError = SGError.invalidCredentials
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    //MARK: Change Status
    
    func testShouldReturnOkWhenChangeStatusHTTPCodeReturnIsSuccess() {
        let expectedReturn = 200
        let filmId = "0001"
        let filmStatus = 0
        var isSuccess: Bool!
        
        stubChangeStatus(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: "getFilmsWithFilmStatusChanged")
        
        filmNetwork.changeFilmStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (result) in
            isSuccess = true
        }) { (error) in
            isSuccess = false
        }
        
        expect(isSuccess).toEventually(equal(true), timeout:timeout)
    }
    
    func testShouldReturnFailWhenChangeStatusHTTPCodeReturnInvalidRequestCode() {
        let expectedReturn = 400
        let filmId = "0001"
        let filmStatus = 0
        var sgError: SGError!
        let expectedError: SGError = SGError.invalidRequest
        
        stubChangeStatus(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.changeFilmStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }

    func testShouldReturnFailWhenChangeStatusHTTPCodeReturnInvalidCredentialsCode() {
        let expectedReturn = 401
        let filmId = "0001"
        let filmStatus = 0
        var sgError: SGError!
        let expectedError: SGError = SGError.invalidCredentials
        
        stubChangeStatus(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.changeFilmStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    func testShouldReturnFailWhenChangeStatusHTTPCodeReturnProperlyAlreadySetCode() {
        let expectedReturn = 403
        let filmId = "0001"
        let filmStatus = 0
        var sgError: SGError!
        let expectedError: SGError = SGError.properlyAlreadySet
        
        stubChangeStatus(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.changeFilmStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    func testShouldReturnFailWhenChangeStatusHTTPCodeReturnNotFoundCode() {
        let expectedReturn = 404
        let filmId = "0001"
        let filmStatus = 0
        var sgError: SGError!
        let expectedError: SGError = SGError.urlNotFound
        
        stubChangeStatus(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.changeFilmStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }
    
    func testShouldReturnFailWhenChangeStatusHTTPCodeReturnServerErrorCode() {
        let expectedReturn = 500
        let filmId = "0001"
        let filmStatus = 0
        var sgError: SGError!
        let expectedError: SGError = SGError.serverError
        
        stubChangeStatus(expectedHTTPReturnCode: expectedReturn, bodyResponseJsonFile: nil)
        
        filmNetwork.changeFilmStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (result) in
            sgError = SGError.unknownError
        }) { (error) in
            sgError = error
        }
        
        expect(sgError).toEventually(equal(expectedError), timeout:timeout)
    }

    
}

