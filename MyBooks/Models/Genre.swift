//
//  Genre.swift
//  MyBooks
//
//  Created by Marcin Jędrzejak on 12/10/2024.
//

import SwiftUI
import SwiftData

@Model
class Genre {
    var name: String
    var color: String
    var books: [Book]?
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}
