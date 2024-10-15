//
//  PreviewContainer.swift
//  MyBooks
//
//  Created by Marcin Jędrzejak on 07/10/2024.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    
    init(_ models: any PersistentModel.Type...) {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema(models)
        do {
            container = try! ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not create previewcontainer")
        }
    }

    func addExamples(_ examples: [any PersistentModel]) {
        Task { @MainActor in
            examples.forEach { example in
                container.mainContext.insert(example)
            }
        }
    }
}
