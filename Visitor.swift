//
//  Visitor.swift
//  Library
//


import Foundation
class Visitor {
    let name: String
    let surname: String
    var books:[Book] = []
    
    init(name:String, surname:String) {
        self.name = name
        self.surname = surname
    }

    func getBook(book:Book) {
        self.books.append(book)
    }
    
    func returnBook() throws -> Book {
        if let book = books.first {
            return book
        } else {
            throw NoBook()
        }
    }
    
    func askForBook() -> Book {
        print("Enter the book visitor wants to ask for:\nauthor: ")
        let keyAuthor = readLine()
        print("title: ")
        let keyTitle = readLine()
        print("year of publication: ")
        let keyYear = readLine()
        let book:Book = Book(author: keyAuthor!, title: keyTitle!, year: Int(keyYear!)!)
        return book
    }
    
    func printSelf() {
        print ("i am \(self.name) \(self.surname), i've taken next books from library:")
        for i in self.books {
            print(i.returnStr())
        }
    }
}

