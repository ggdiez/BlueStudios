//
//  MockFilmAPIClient.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

final class MockFilmAPIClient: FilmAPIClient, MockAPIProtocol {
    
    override func getFilms(onSuccess: @escaping ([Film]) -> Void, failure onFailure: @escaping (SGError?) -> Void) {
        
        let fileName = "getFilms"
        let jsonString = fromJsonFile(fileName)
        let jsonStr = jsonString as String
        let jsonData = Data(jsonStr.utf8)
        
        do {
            let decoder = JSONDecoder()
            let films: [Film] = try decoder.decode([Film].self, from: jsonData)
            onSuccess(films)
            
        } catch let error {
            print(error)
            onFailure(SGError.serverReturnIncompleteData)
        }
    }
    
    override func changeFilmStatus(filmId: String, filmStatus: Int, onSuccess: @escaping ([Film]) -> Void, failure onFailure: @escaping (SGError?) -> Void) {
        
        let fileName = "getFilmsWithFilmStatusChanged"
        let jsonString = fromJsonFile(fileName)
        let jsonStr = jsonString as String
        let jsonData = Data(jsonStr.utf8)
        
        do {
            let decoder = JSONDecoder()
            let films: [Film] = try decoder.decode([Film].self, from: jsonData)
            onSuccess(films)
            
        } catch let error {
            print(error)
            onFailure(SGError.serverReturnIncompleteData)
        }
        
    }
}
