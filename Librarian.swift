//
//  Librarian.swift
//  Library
//

import Foundation

class Librarian {
    let name: String
    let surname: String
    var lib: Library
    
    init(name:String, surname:String, lib:Library){
        self.name = name
        self.surname = surname
        self.lib = lib
    }
    
    func giveBook(book : Book) -> Book {
        do {
            try lib.removeBook(book: book)
        } catch is NoBook {
            print("There is no such book in the library")
        } catch is OverBook {
            print("Sorry, this book is over, come here later")
        } catch {
            print()
        }
        return book
    }
    func takeBook(book: Book) {
        lib.addBook(book:book)
    }
}
