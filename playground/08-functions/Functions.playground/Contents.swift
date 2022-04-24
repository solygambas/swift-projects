// built-in functions
//
//print(min("Potato", "Tomato", "Cabbage")) // Cabbage
//print(max(8, 9, 10, 11, 104, -104)) // 104

// inout parameter

//func multiplyBy42(_ number: inout Int) {
//    number = number * 42
//    print("The number multiplied by 42: \(number)") // 126
//}
//
//var myNumber = 3
//multiplyBy42(&myNumber)
//print("My number is \(myNumber)") // 126

// return

//func greet(name: String, favoriteNumber: Int, likesKaraoke: Bool) {
//    "Hi \(name)! Your favorite number is \(favoriteNumber), and you \(likesKaraoke ? "like" : "don't like") karaoke."
//}
//
//greet(name: "Paris", favoriteNumber: 6, likesKaraoke: true)

// function types as parameter values

//func addNumbers(_ first: Int, _ second: Int) -> Int {
//    first + second
//}
//
//func substractNumbers(_ first: Int, _ second: Int) -> Int {
//    first - second
//}
//
//func multiplyNumbers(_ first: Int, _ second: Int) -> Int {
//    first * second
//}
//
//func doMathPrintMath(_ manipulateInteger: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//    print("The result is \(manipulateInteger(a, b))")
//}
//
//doMathPrintMath(addNumbers, 5, 10) // 15
//doMathPrintMath(substractNumbers, 5, 10) // -5
//doMathPrintMath(multiplyNumbers, 5, 10) // 50

// return multiple values

//func greetingsFor(name: String) -> (hello: String, goodbye: String, wait: String) {
//    let hello = "Welcome to the pizza shop, \(name)!"
//    let goodbye = "Thanks for visiting the pizza shop, \(name)!"
//    let wait = "Please \(name), wait for your order while it's cooking!"
//    return (hello, goodbye, wait)
//}
//
//print(greetingsFor(name: "Bob").wait) // Please Bob, wait for your order while it's cooking!

func billSplit(totalCost: Double, tip: Int = 20, guestNumber: Int = 2) {
    let actualTip = Double(tip)/100.0 * totalCost
    let totalPerGuest = (totalCost + actualTip) / Double(guestNumber)
    print("You have to pay $\(totalPerGuest) per guest") // 54.0
}

billSplit(totalCost: 180.0, tip: 20, guestNumber: 4)
