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

var dessertPizzasOrders = ["Rocky Road": 2, "Nutella": 3, "Caramel Swirl": 1]
print(dessertPizzasOrders["Rocky Road"]!)
print(dessertPizzasOrders["Caramel Swirl"]!)
dessertPizzasOrders.updateValue(17, forKey: "Banana Split")
