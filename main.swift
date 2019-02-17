//
//  main.swift
//  Library
//


import Foundation

func giveBook(_ visitor: Visitor, _ librarian: Librarian) {
    let ask = visitor.askForBook()
    let give = librarian.giveBook(book: ask)
    visitor.getBook(book: give)
    print("\(ask.title) by \(ask.author) has been given to \(visitor.name) \(visitor.surname)!\n")
}

func takeAwayBook(_ visitor: Visitor, _ librarian: Librarian) {
    do {
        let returned = try visitor.returnBook()
        librarian.takeBook(book: returned)
    } catch is NoBook {
        print("i have ho books to return")
    } catch { return }
    
    
}

var lib:Library = Library()
lib.addFromFile(filename: "books")

let visitor: Visitor = Visitor(name: "Misha", surname: "Sho")

let librarian: Librarian = Librarian(name: "Galina", surname: "Ivanovna", lib: lib)

lib.printSelf()

giveBook(visitor, librarian)

visitor.printSelf()

lib.printSelf()

takeAwayBook(visitor, librarian)

lib.printSelf()
