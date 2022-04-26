// optionals

//var favoriteQuote: String?
//
//if (favoriteQuote != nil) {
//    print("My favorite quote is: '\(favoriteQuote!)'")
//} else {
//    print("I don't have a favorite quote.")
//}
//
//struct Person {
//    var name: String
//    var coffeesConsumed: Int?
//}
//
//var josh = Person(name: "Josh", coffeesConsumed: 5)
//var tom = Person(name: "Tom")
//
//if let coffees = josh.coffeesConsumed {
//    print("The unwrapped value is: \(coffees)")
//} else {
//    print("Nothing in there.")
//}

// guard let

//func order(pizza: String?, quantity: Int) {
//
//    guard let unwrappedPizza = pizza else {
//        print("No specific pizza ordered")
//        return
//    }
//
//    print("\(quantity) \(unwrappedPizza) pizzas were ordered")
//
//}

//struct Person {
//    var name: String
//    var favoriteSong: Song
//    var favoriteKaraokeSong: Song?
//}
//
//struct Song {
//    var name: String
//}
//
//let paris = Person(name: "Paris", favoriteSong: Song(name: "Learning to Fly - Pink Floyd"),
//                   favoriteKaraokeSong: Song(name: "Africa - Toto"))
//let bob = Person(name: "Bob", favoriteSong: Song(name: "Shake it off - Taylor Swift"))
//let susan = Person(name: "Susan", favoriteSong: Song(name: "Zombie - The Cranberries"))
//
//let users = [paris, bob, susan]
//
//users.forEach { user in
//    if let favKaraokeSong = user.favoriteKaraokeSong {
//        print(user.favoriteKaraokeSong!)
//    } else {
//        print("\(user.name) doesn't have a favorite song")
//    }
//}

// failable initializer

struct Shape {
    var sides: Int
    
    init?(sides: Int) {
        guard sides >= 3 && sides <= 9 else { return nil }
        
        self.sides = sides
    }
    
    func printShape() {
        print("Shape has \(sides) sides")
    }
}

var box = Shape(sides: 4)
var triangle = Shape(sides: 3)
var triquandle = Shape(sides: -4) // nil
var decagon = Shape(sides: 10) // nil

// coalescing operator
var dogBreed: String?
dogBreed = "Beagle"
print("Look at the cute \(dogBreed ?? "doggo")!")
