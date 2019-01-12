//
//  FilmAPIClientTestCase.swift
//  BlueStudiosTests
//
//  Created by Gonzalo Gonzalez  on 10/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import Nimble
import XCTest

@testable import BlueStudios


class FilmAPIClientTestCase: XCTestCase {
    
    let mockFilmAPIClient: MockFilmAPIClient = MockFilmAPIClient()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
    }
    
    func testShouldReturnSixFilmsGettingFilms () {
        let expectedNumberOfFilms: Int = 6
        var returnedNumberOfFilms: Int!
        
        
        mockFilmAPIClient.getFilms(onSuccess: { (films) in
            returnedNumberOfFilms = films.count
        }) { (error) in
            returnedNumberOfFilms = 0
        }
        
        expect(returnedNumberOfFilms).toEventually(equal(expectedNumberOfFilms))
    }
    
    func testShouldReturnPropertyFilmsGettingFilms () {
        let expectedFilmsTitleCollection: [String]  = ["Bad Boys II", "Bad Boys Forever", "Top Gun II", "Harry Potter XIX", "Rocky 9", "Rambo 7"]
        var returnedFilmsTitleCollection: [String]!
        
        
        mockFilmAPIClient.getFilms(onSuccess: { (films) in
            returnedFilmsTitleCollection = films.map{$0.name}
        }) { (error) in
            returnedFilmsTitleCollection = []
        }
        
        expect(returnedFilmsTitleCollection).toEventually(equal(expectedFilmsTitleCollection))
    }
    
    func testShouldReturnPropertyNumberOfFilmsInProduction () {
        let expectedFilmsInProduction: Int = 2
        let inProductionStatus: FilmStatus = FilmStatus.inProduction
        var returnedFilmsInProduction: Int!
        
        mockFilmAPIClient.getFilms(onSuccess: { (films) in
            let filteredFilms = films.filter{$0.status == inProductionStatus.rawValue}
            returnedFilmsInProduction = filteredFilms.count
        }) { (error) in
            returnedFilmsInProduction = 0
        }
        
        expect(returnedFilmsInProduction).toEventually(equal(expectedFilmsInProduction))
    }
}
