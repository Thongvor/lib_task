//
//  Book.swift
//  Library
//


import Foundation

class Book: Hashable {
    let author: String
    let title: String
    let year: Int
    
    init(author: String, title:String, year: Int) {
        self.author = author
        self.title = title
        self.year = year
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.author == rhs.author && lhs.title == rhs.title && lhs.year == rhs.year
    }
    
    func hash(into hasher: inout Hasher) {

    }
    
    func returnStr() -> String {
        return "author: \(self.author), title: \(self.title), year: \(self.year)\n"
    }
}
