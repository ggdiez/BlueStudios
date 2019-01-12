//
//  FilmAPIClient.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

class FilmAPIClient {
    
    let filmNetwork: FilmNetwork = FilmNetwork()
    
    func getFilms (onSuccess: @escaping (_ films: [Film]) -> Void, failure onFailure: @escaping (_ error: SGError?) -> Void ) {
        
        filmNetwork.getFilms(onSuccess: { (result) in
            
            do {
                let decoder = JSONDecoder()
                let films: [Film] = try decoder.decode([Film].self, from: result.value as! Data)
                onSuccess(films)
            } catch let error {
                print(error)
                onFailure(SGError.serverReturnIncompleteData)
            }
            
        }) { (error) in
            onFailure(error)
        }
    }
    
    func changeFilmStatus (filmId: String, filmStatus: Int, onSuccess: @escaping (_ films: [Film]) -> Void, failure onFailure: @escaping (_ error: SGError?) -> Void ) {
        
        filmNetwork.changeFilmStatus(filmId: filmId, filmStatus: filmStatus, onSuccess: { (result) in
            do {
                let decoder = JSONDecoder()
                let films: [Film] = try decoder.decode([Film].self, from: result.value as! Data)
                onSuccess(films)
            } catch let error {
                print(error)
                onFailure(SGError.serverReturnIncompleteData)
            }
            
        }) { (error) in
            onFailure(error)
        }
    }
}
