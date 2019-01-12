//
//  FilmsViewModel.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

class FilmsViewModel {
    
    var filmService: FilmService!
    
    
    //MARK: Events
    var didFilmsLoaded: (([Film]) -> Void)?

    
    init (filmService: FilmService) {
        self.filmService = filmService
    }
    
    func loadFilms () {
        
        filmService.getFilms(onSuccess: { (films) in
            print(films)
            self.didFilmsLoaded!(films)
        }) { (error) in
            print(error)
        }
    }
    
    func changeFilmStatus (filmId: String, filmStatus: FilmStatus) {
        
        filmService.changeFilmStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (films) in
            self.didFilmsLoaded!(films)
        }) { (error) in
            print(error)
        }
    }
}
