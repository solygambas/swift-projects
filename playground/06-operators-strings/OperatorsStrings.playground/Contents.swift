// basic operators

//2 * 42 / 3 - 4 // 24
//4 + 5 * 5 // 29
//4 % 2 // 0 = even
//10.0 / 6.0 // 1.66...

// constants and variables

//var pizzaSlicesRemaining = 8
//let totalSlices = 8
//totalSlices / pizzaSlicesRemaining
//pizzaSlicesRemaining = 4
//totalSlices / pizzaSlicesRemaining
//
//var number = 1
////number = "Hello"
//
//var pizzaShopName = "Big Mike's Pizzeria"
//pizzaShopName = "Swift Pizza"

// types

//var pizzaTopping: String
//pizzaTopping = "Oregano"

// adding strings

var favoriteQuote = "Expose yourself to your deepest fear; after that, fear has no power, and the fear of freedom shrinks and vanishes. You are free."
favoriteQuote += " by Jim Morrison"
print(favoriteQuote)

// string interpolation

var name = "Head First Reader"
var timeLearning = "3 days"
var goal = "make an app for my kids"
var platform = "iPad"

print("Hello, I'm \(name), and I've been learning Swift for \(timeLearning). My goal is to \(goal). I'm particularly interested in the \(platform) platform.")
