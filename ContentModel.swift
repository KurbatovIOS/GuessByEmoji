//
//  File.swift
//  Guess by emoji
//
//  Created by Kurbatov Artem on 06.04.2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var movies: [Movie]
    @Published var results: [Result]
    @Published var timeRemaining = 60
    
    init(){
        
        results = []
        
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            
            if let decoded = try? JSONDecoder().decode([Result].self, from: data) {
                results = decoded
            }
        }
        
        movies = [Movie(id: UUID(), emojis: "ππͺ", title: "Dumbo"),
                  Movie(id: UUID(), emojis: "π₯π΄ββ οΈπ", title: "Pirates of the Caribbean", validAnswer: "Pirates of Caribbean"),
                  Movie(id: UUID(), emojis: "πΊπΈπ°", title: "American Pie"),
                  Movie(id: UUID(), emojis: "π©ββ€οΈβπ¨π³π₯Ά", title: "Titanic"),
                  Movie(id: UUID(), emojis: "π¦π»β‘οΈπ°", title: "Harry Potter"),
                  Movie(id: UUID(), emojis: "π·πββοΈ", title: "Spider-Man", validAnswer: "Spider Man"),
                  Movie(id: UUID(), emojis: "π±πͺ", title: "Scream"),
                  Movie(id: UUID(), emojis: "π¦π", title: "The Lion King", validAnswer: "Lion King"),
                  Movie(id: UUID(), emojis: "πβοΈπ€", title: "Transformers"),
                  Movie(id: UUID(), emojis: "π ππ¦", title: "Home Alone"),
                  Movie(id: UUID(), emojis: "βΎοΈβ¨π§ ", title: "Eternal Sunshine of the Spotless Mind", validAnswer: "Eternal Sunshine of Spotless Mind"),
                  Movie(id: UUID(), emojis: "ππ¦", title: "King Kong"),
                  Movie(id: UUID(), emojis: "ππ»ββοΈπ€²βοΈ", title: "Edward Scissorhands"),
                  Movie(id: UUID(), emojis: "π§ββοΈβ‘οΈπ¨", title: "Thor"),
                  Movie(id: UUID(), emojis: "π₯ππ»ββοΈπΊ", title: "The Truman Show", validAnswer: "Truman Show"),
                  Movie(id: UUID(), emojis: "π₯πΆ", title: "The Karate Kid", validAnswer: "Karate Kid"),
                  Movie(id: UUID(), emojis: "πππ½", title: "Men in Black"),
                  Movie(id: UUID(), emojis: "ππ ", title: "Finding Nemo", validAnswer: "Finding Dory"),
                  Movie(id: UUID(), emojis: "π«π»", title: "Ghostbusters"),
                  Movie(id: UUID(), emojis: "πππ¦", title: "Night at the Museum", validAnswer: "Night at Museum")]
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(results) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    

    func findMovie(_ id: UUID) -> Int {
        
        for index in 0..<movies.count {
            
            if movies[index].id == id {
                return index
            }
        }
        return 0
    }
    
    
    func removeResult(id: UUID) {
        
        for index in 0..<results.count {
            if results[index].id == id {
                results.remove(at: index)
                break
            }
        }
    }
    
    
    func resetGuessed() {
        
        for index in 0..<movies.count {
            movies[index].guessed = false
        }
    }
}
