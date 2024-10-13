//
//  GenreSamples.swift
//  MyBooks
//
//  Created by Marcin Jędrzejak on 12/10/2024.
//

import Foundation

extension Genre {
    static var sampleGenres: [Genre] {
        [
            Genre(name: "Fiction", color: "00FF00"),
            Genre(name: "Non Fiction", color: "0000FF"),
            Genre(name: "Romance", color: "FF0000"),
            Genre(name: "Thriler", color: "000000")
        ]
    }
}
