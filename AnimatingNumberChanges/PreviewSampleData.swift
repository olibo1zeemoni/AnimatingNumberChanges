//
//  PreviewSampleData.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 07/09/2023.
//

import SwiftUI
import SwiftData

@MainActor
let previewSampleData : ModelContainer = {
    do {
        let container = try ModelContainer(for: Person.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        for person in DataStore.persons {
            container.mainContext.insert(person)
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
