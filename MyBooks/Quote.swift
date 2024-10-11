//
//  Quote.swift
//  MyBooks
//
//  Created by Marcin Jędrzejak on 11/10/2024.
//

import Foundation
import SwiftData

@Model
class Quote {
    var creationDate: Date = Date.now
    var text: String
    var page: String?
    
    init(text: String, page: String? = nil) {
        self.text = text
        self.page = page
    }
}
