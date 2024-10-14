//
//  GenresStackView.swift
//  MyBooks
//
//  Created by Marcin Jędrzejak on 14/10/2024.
//

import SwiftUI

struct GenresStackView: View {
    var genres: [Genre]
    
    var body: some View {
        HStack {
            ForEach(genres.sorted(using: KeyPathComparator(\Genre.name))) { genre in
                Text(genre.name)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 5).fill(genre.hexColor))
            }
        }
    }
}

//#Preview {
//    GenresStackView()
//}
