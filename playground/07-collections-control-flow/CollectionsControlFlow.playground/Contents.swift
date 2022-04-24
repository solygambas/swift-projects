// arrays

//var pizzaNames = ["Hawaiian", "Cheese", "Margherita", "Meatlovers", "Vegetarian", "Prosciutto", "Vegan"]
//
//print(pizzaNames[4])
//pizzaNames.append("Pepperoni")
//pizzaNames.insert("Ham, Pineapple, and Pesto", at: 2)
//pizzaNames.remove(at: 1)
//pizzaNames[5] = "Pumpkin and Feta"
//print(pizzaNames)

// sets

//var forbiddenPizzas: Set = ["Lemon and Pumpkin", "Hawaiian with a Fried Egg", "Schnitzel and Granola"]
//forbiddenPizzas.insert("Chicken and Boston Beans")
//forbiddenPizzas.remove("Lemon and Pumpkin")
//print(forbiddenPizzas)

// dictionaries

//var dessertPizzasOrders = ["Rocky Road": 2, "Nutella": 3, "Caramel Swirl": 1]
//print(dessertPizzasOrders["Rocky Road"]!)
//print(dessertPizzasOrders["Caramel Swirl"]!)
//dessertPizzasOrders["Banana Split"] = 17

// if statements

//var hawaiianPizzaOrdered = true
//var veganPizzaOrdered = true
//var pepperoniPizzaOrdered = false

//if (hawaiianPizzaOrdered) {
//    print("You must deliver an hawaiian pizza")
//    hawaiianPizzaOrdered = false
//}
//if (veganPizzaOrdered) {
//    print("You must deliver a vegan pizza")
//    veganPizzaOrdered = false
//}
//if (pepperoniPizzaOrdered) {
//    print("You must deliver a pepperoni pizza")
//    pepperoniPizzaOrdered = false
//}

//var pizzasOrders = ["Hawaiian Pizza": 2, "Vegan Pizza": 1, "Pepperoni Pizza": 9]
//
//if (pizzasOrders["Hawaiian Pizza"]! > 0) {
//    print("You must deliver \(pizzasOrders["Hawaiian Pizza"]!) x Hawaiian Pizza")
//}
//if (pizzasOrders["Vegan Pizza"]! > 0) {
//    print("You must deliver \(pizzasOrders["Vegan Pizza"]!) x Vegan Pizza")
//}
//if (pizzasOrders["Pepperoni Pizza"]! > 0) {
//    print("You must deliver \(pizzasOrders["Pepperoni Pizza"]!) x Pepperoni Pizza")
//}

//var planet = "Jupiter"
//if (planet == "Jupiter") {
//    print("Jupiter is named after the Roman king of the gods.")
//} else if (planet == "Mars") {
//    print("Mars has a lot of Earth-made rovers on it.")
//} else {
//    print("All the planets are pretty cool.")
//}

// switch

//var number = 7
//
//switch number {
//    case 7:
//        print("It is lucky number 7")
//    default:
//        print("I've told you everything I know about lucky numbers")
//}

// ranges

//let firstRange = 72...96
//let secondRange = -100...100
//let thirdRange = 9...
//let fourthRange = ...37000

// for loops

//for num in 1...20 {
//    if (num % 2 != 0) {
//        print(num)
//    }
//}

// sorting pizzas

//var pizzasChoices = ["Hawaiian", "Cheese", "Margherita", "Meatlovers", "Vegetarian", "Prosciutto", "Vegan"]
//pizzasChoices.sort()
//for pizza in pizzasChoices {
//    print(pizza)
//}
// pizzas = pizzas.sorted()
// print(pizzas)

// while

//var number = 1
//
//while (number < 100) {
//    number *= 2
//    print(number)
//}

// repeat-while

//var currentLevel = 1
//var winningLevel = 10
//
//repeat {
//    print("We're at level \(currentLevel) of \(winningLevel)!")
//    currentLevel += 1
//} while (currentLevel <= 10)
//print("Game finished")
