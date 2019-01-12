//
//  Film.swift
//  BlueStudios
//
//  Created by Gonzalo Gonzalez  on 09/11/2018.
//  Copyright © 2018 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

struct Film: Codable {
    var _id: String
    var name: String
    var date: String
    var status: Int
    
    func getStatus () -> FilmStatus {
        return FilmStatus.getStatus(status: self.status)!
    }
}
