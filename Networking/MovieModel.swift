//
//  MovieModel.swift
//  Networking
//
//  Created by Hariom Palkar on 26/10/20.
//

import Foundation

import Foundation

struct Movie: Codable, Identifiable {
    var id = UUID()
    let movieId: Int
    let originalTitle: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case originalTitle = "original_title"
        case title
    }
}
