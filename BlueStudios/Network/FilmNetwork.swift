//
//  FilmNetwork.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import Alamofire

class FilmNetwork {
    
    let networkManager: NetworkManager = NetworkManager.instance
    
    func getFilms (onSuccess: @escaping (_ result: Result<Any>) -> Void, failure onFailure: @escaping (_ error: SGError?) -> Void ){
        
        networkManager.alamofireManager.request(FilmRouter.getFilms()).responseJSON {
            response in
            
            response.result.ifSuccess({
               onSuccess(response.result)
            })
            
            response.result.ifFailure({
                if let statusCode = response.response?.statusCode {
                    onFailure(SGError.checkErrorCode(statusCode))
                } else {
                    onFailure(SGError.unknownError)
                }
            })
          
        }
    }
    
    func changeFilmStatus (filmId: String, filmStatus: Int, onSuccess: @escaping (_ result: Result<Any>) -> Void, failure onFailure: @escaping (_ error: SGError?) -> Void ){
        
        networkManager.alamofireManager.request(FilmRouter.changeFilmStatus(filmId, filmStatus)).responseJSON {
            response in
            
            response.result.ifSuccess({
                onSuccess(response.result)
            })
            
            response.result.ifFailure({
                if let statusCode = response.response?.statusCode {
                    onFailure(SGError.checkErrorCode(statusCode))
                } else {
                    onFailure(SGError.unknownError)
                }
            })
            
        }
    }
    
}
