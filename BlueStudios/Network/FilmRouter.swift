//
//  FilmRouter.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import Alamofire

public enum FilmRouter : URLRequestConvertible {
    static let baseUrl = Server.url
    
    case getFilms()
    case changeFilmStatus(String, Int)
    
    public func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .getFilms:
                return .get
            case .changeFilmStatus:
                return .post
            }
        }
        
        let params: ([String : Any]?) = {
            switch self {
            case .getFilms():
                return [:]
            case .changeFilmStatus(let filmId, let filmStatus):
                return [Parameters.filmID: filmId, Parameters.filmStatus: filmStatus]
            }
        }()
        
        let url: URL = {
            let relativePath: String?
            let baseUrl: String = FilmRouter.baseUrl
            switch self {
            case .getFilms:
                relativePath = EndPoints.films
            case .changeFilmStatus(_, _):
                relativePath = EndPoints.films
            }
            var url: URL = URL(string: baseUrl)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        var headers: HTTPHeaders? {
            switch self {
            case .getFilms():
                return [:]
            case .changeFilmStatus(_, _):
                return [:]
            }
        }
        
        if headers != nil {
            urlRequest.allHTTPHeaderFields = headers!
        }
        
        return try encoding.encode(urlRequest, with: params)
    }
}

