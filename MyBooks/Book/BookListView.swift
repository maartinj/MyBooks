//
//  BookListView.swift
//  MyBooks
//
//  Created by Marcin Jędrzejak on 19/08/2024.
//

// Completed 8. SwiftData CloudKit
import SwiftUI
import SwiftData

enum SortOrder: LocalizedStringResource, Identifiable, CaseIterable {
    case status, title, author
    
    var id: Self {
        self
    }
}

struct BookListView: View {
    @State private var createNewBook = false
    @State private var sortOrder = SortOrder.status
    @State private var filter = ""
    var body: some View {
        NavigationStack {
            Picker("", selection: $sortOrder) {
                ForEach(SortOrder.allCases) { sortOrder in
                    Text("Sort by \(sortOrder.rawValue)").tag(sortOrder)
                }
            }
            .buttonStyle(.bordered)
            BookList(sortOrder: sortOrder, filterString: filter)
                .searchable(text: $filter, prompt: Text("Filter on title or author"))
                .navigationTitle("My Books")
                .toolbar {
                    Button {
                        createNewBook = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                }
                .sheet(isPresented: $createNewBook) {
                    NewBookView()
                        .presentationDetents([.medium])
                }
        }
    }
}

#Preview("English") {
    // BookListView()
    //     .modelContainer(for: Book.self, inMemory: true)
    let preview = Preview(Book.self)
    let books = Book.sampleBooks
    let genres = Genre.sampleGenres
    preview.addExamples(books)
    preview.addExamples(genres)
    return BookListView()
        .modelContainer(preview.container)
}

#Preview("German") {
    // BookListView()
    //     .modelContainer(for: Book.self, inMemory: true)
    let preview = Preview(Book.self)
    let books = Book.sampleBooks
    let genres = Genre.sampleGenres
    preview.addExamples(books)
    preview.addExamples(genres)
    return BookListView()
        .modelContainer(preview.container)
        .environment(\.locale, .init(identifier: "DE"))
}
