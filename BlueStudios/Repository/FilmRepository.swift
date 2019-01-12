//
//  FilmRepository.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import UIKit

enum FilmStatus : Int, CaseIterable {
    case inProduction
    case filming
    case ready
    
    static func getStatus (status: Int) -> FilmStatus? {
        switch status {
        case 0 : return .inProduction
        case 1 : return .filming
        case 2 : return .ready
        default:
            return .inProduction
        }
    }
    
    func string () -> String {
        switch self {
        case .inProduction: return "In Production"
        case .filming: return "Filming"
        case .ready: return "Ready"
        }
    }
    
    func color () -> UIColor {
        switch self {
        case .inProduction: return UIColor.orange
        case .filming: return UIColor.cyan
        case .ready: return UIColor.green
        }
    }
}

class FilmRepository {
    
    private let filmAPIClient: FilmAPIClient = FilmAPIClient()
    var currentFilms: [Film] = []
    
    func returnCurrentFilms () -> [Film] {
        return currentFilms
    }
    
    func retrieveFilms (onSuccess: @escaping (_ films: [Film]) -> Void, failure onFailure: @escaping (_ error: SGError?) -> Void) {
        
        filmAPIClient.getFilms(onSuccess: { (films) in
            self.currentFilms = films
            onSuccess(films)
        }) { (error) in
            onFailure(error)
        }
    }
    
    func retrieveFilmsWithChangedStatus (filmId: String, filmStatus: FilmStatus, onSuccess: @escaping (_ films: [Film]) -> Void, failure onFailure: @escaping (_ error: SGError?) -> Void) {
        
        filmAPIClient.changeFilmStatus(filmId: filmId, filmStatus: filmStatus.rawValue, onSuccess: { (films) in
            self.currentFilms = films
            onSuccess(films)
        }) { (error) in
            onFailure(error)
        }
    }
}
