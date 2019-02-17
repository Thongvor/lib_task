//
//  Library.swift
//  Library
//


import Foundation

class Library {
    var array: [Book:Int]

    init() {
        array = [:]
    }
    
    init(library: Library) {
        self.array = library.array
    }
    
    func addBook(book: Book) {
        var newAmount: Int
        if let amount = self.array[book] {
            newAmount = amount + 1
        } else {
            newAmount = 1
        }
        self.array[book] = newAmount
    }
    
    func removeBook(book: Book) throws {
        var newAmount: Int
        if let amount = self.array[book] {
            if amount != 0 {
                newAmount = amount - 1
            } else {
                throw OverBook()
            }
        } else {
            throw NoBook()
        }
        self.array[book] = newAmount
    }
    
    func addFromFile(filename:String) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(filename)
            do {
                let data = try String(contentsOf: fileURL, encoding: .utf8)
                var array = data.components(separatedBy: [" ", "\n"])
                for i in stride(from: 0, to: array.count, by: 3) {
                    let newBook:Book = Book(author: array[i],title: array[i+1],year: Int(array[i+2])!)
                    self.addBook(book: newBook)
                    
                }
            }
            catch {print("bad file")}
        }
    }
    
    func printSelf() {
        print("LIBRARY: ")
        for k in self.array {
            print("\(k.key.returnStr())(amount: \(k.value))")
        }
    }
}
