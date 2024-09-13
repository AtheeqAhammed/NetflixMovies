//
//  MovieModel.swift
//  NetflixMovies
//
//  Created by Ateeq Ahmed on 13/09/24.
//

import Foundation

struct MovieModel: Codable {
    var title: String
    var imagePortrait: String
    var language: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case imagePortrait = "image_portrait"
        case language
        case description
    }
}
