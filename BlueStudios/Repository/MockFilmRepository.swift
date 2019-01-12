//
//  MockFilmRepository.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

final class MockFilmRepository: FilmRepository {
    
    let mockFilmAPIClient: MockFilmAPIClient = MockFilmAPIClient()
   
    override func retrieveFilms(onSuccess: @escaping ([Film]) -> Void, failure onFailure: @escaping (SGError?) -> Void) {
        
        mockFilmAPIClient.getFilms(onSuccess: { (films) in
            self.currentFilms = films
            onSuccess(films)
        }) { (error) in
            onFailure(error)
        }
    }
    
    override func retrieveFilmsWithChangedStatus(filmId: String, filmStatus: FilmStatus, onSuccess: @escaping ([Film]) -> Void, failure onFailure: @escaping (SGError?) -> Void) {
        
        mockFilmAPIClient.changeFilmStatus(filmId: filmId, filmStatus: filmStatus.rawValue, onSuccess: { (films) in
            self.currentFilms = films
            onSuccess(films)
        }) { (error) in
            onFailure(error)
        }
    }
}
