// Created by: Jimmi Andersen on 19/05/2023
import SwiftUI
import RealmSwift

// Realm Models
class Person: Object, ObjectKeyIdentifiable {
    @Persisted var name: String
    @Persisted var dog: Dog?

    convenience init(name: String) {
        self.init()
        self.name = name
        self.dog = Dog(name: "Fido", age: 5)
    }
}

class Dog: Object, ObjectKeyIdentifiable {
    @Persisted var name: String
    @Persisted var age: Int

    convenience init(name: String, age: Int) {
        self.init()
        self.name = name
        self.age = age
    }
}

// SwiftUI Views
struct ContentView: View {
    @Environment(\.realm) var realm
    @ObservedRealmObject var person: Person
    @State private var showSheet = false

    var body: some View {
        NavigationView {
            Form {
                Text("Person's Name: \(person.name)")
                if let dog = person.dog {
                    Button(action: {
                        showSheet = true
                    }) {
                        Text("Dog's Age: \(dog.age)")
                    }
                    .sheet(isPresented: $showSheet) {
                        DogView(dog: dog)
                    }
                }
            }
        }
    }
}

struct DogView: View {
    @ObservedRealmObject var dog: Dog

    var body: some View {
        Stepper("Age: \(dog.age)", value: $dog.age, in: 0...20)
    }
}
