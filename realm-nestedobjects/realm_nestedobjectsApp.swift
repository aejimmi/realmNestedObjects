// Created by: Jimmi Andersen on 19/05/2023

import SwiftUI

@main
struct realm_nestedobjectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(person: Person(name: "John"))
        }
    }
}
