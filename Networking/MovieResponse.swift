//
//  MovieResponse.swift
//  Networking
//
//  Created by Hariom Palkar on 26/10/20.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
