// closures

//var closureMessage = {
//    print("Closures are pretty similar to functions!")
//}
//let bookTitle = {
//    print("Head First Kotlin")
//}

//let multiplyNumbers = { (number1: Int, number2: Int) in
//    return "The result is \(number1 * number2)"
//}
//
//print(multiplyNumbers(10, 50))

//let cheeseyPizza = {
//    print("One Cheesey pizza, coming up!")
//    print("Cheesey pizza is just cheese, more cheese, and more cheese.")
//}
//
//let plainPizza = {
//    print("One Plain pizza, coming up!")
//    print("Cheesey pizza is just cheese, more cheese, and more cheese.")
//}
//
//func order(pizza: () -> Void) {
//    print("# Ready to order pizza! #")
//    pizza()
//    print("# Order for pizza placed! #")
//}
//
//order(pizza: cheeseyPizza)
//order(pizza: plainPizza)

//let neverGonnaGiveYouUp = { (medium: String) -> String in
//    "'Never gonna give you up' on \(medium)"
//}
//let byeByeBye = { (medium: String) -> String in
//    "'Bye bye bye' on \(medium)"
//}
//
//func performWithPiano(song: (String) -> String) {
//    let performance = song("Piano")
//    print(performance)
//}
//
//performWithPiano(song: neverGonnaGiveYouUp)
//performWithPiano(song: byeByeBye)

//func operateOn(_ array: [Int], operation: (Int, Int) -> Int) -> Int {
//    var cur = array[0]
//    for item in array[1...] {
//        cur = operation(cur, item)
//    }
//    return cur
//}
//
//let numbers = [7, 14, 6, 1, 8]
//
//let test = operateOn(numbers, operation: {(total: Int, next: Int) in
//    return total * next
//})
//let sumResult = operateOn(numbers, operation: +)
//
//let sumClosure = {(total: Int, next: Int) in
//    return total + next
//}
//
//let sumTest = operateOn(numbers, operation: sumClosure)
//
//print(test) // 4784
//print(sumResult) // 36
//print(sumTest) // 36

//func counter() -> () -> Int {
//    var count = 0
//    let incrementer: () -> Int = {
//        count += 1
//        return count
//    }
//    return incrementer
//}
//
//let myCounter = counter()
//let secondCounter = counter()
//myCounter()
//myCounter()
//myCounter() // 3
//secondCounter() // 1

// autoclosures

//func servePizza(box: Bool, pizza: @autoclosure
//    () -> String) {
//    if (box) {
//        print("Boxing the pizza '\(pizza())'")
//    } else {
//        print("We're all done.")
//    }
//}
//
//func nextPizza() -> String {
//    return "Hawaiian"
//}
//
//servePizza(box: true, pizza: nextPizza())
//servePizza(box: true, pizza: "Cheesey")

