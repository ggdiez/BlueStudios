//
//  FilmService.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

final class FilmService {
    
    static let instance: FilmService = {
        let filmRepository = FilmRepository()
        let shared = FilmService(filmRepository: filmRepository)
        return shared
    }()
    
    static let mockInstance: FilmService = {
        let mockFilmRepository = MockFilmRepository()
        let shared = FilmService(filmRepository: mockFilmRepository)
        return shared
    }()
    
    private var filmRepository: FilmRepository!
    
    private init(filmRepository: FilmRepository) {
        self.filmRepository = filmRepository
    }
    
    func returnFilms () -> [Film] {
        return filmRepository.returnCurrentFilms()
    }
    
    func getFilms (onSuccess: @escaping (_ films: [Film] ) -> Void, failure onFailure: @escaping (_ error: SGError?) -> Void) {
        
        filmRepository.retrieveFilms(onSuccess: { (films) in
            onSuccess(films)
        }) { (error) in
            onFailure(error)
        }
    }
    
    func changeFilmStatus (filmId: String, filmStatus: FilmStatus, onSuccess: @escaping (_ films: [Film] ) -> Void, failure onFailure: @escaping (_ error: SGError?) -> Void) {
        
        filmRepository.retrieveFilmsWithChangedStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (films) in
            onSuccess(films)
        }) { (error) in
            onFailure(error)
        }
    }
}
