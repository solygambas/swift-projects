//class Pizza {
//    var name = "Pepperoni"
//
//    func showName() {
//        print("The pizza is a \(name)")
//    }
//
//    func makeHawaiian() {
//        name = "Hawaiian"
//    }
//
//    func makeVegetarian() {
//        name = "Vegetarian"
//    }
//}
//
//let myPizza = Pizza()
//myPizza.showName()

var ingredients = [
    "Pepperoni", "Mozzarella", "Bacon", "Sausage", "Basil", "Garlic", "Onion", "Oregano",
    "Mushromm", "Tomato", "Red Pepper", "Ham", "Chicken", "Red Onion", "Black Olives",
    "Bell Pepper", "Pineapple", "Canadian Bacon", "Salami", "Jalapeño", "Spinach",
    "Italian Sausage", "Provolone", "Pesto", "Sun-Dried Tomato", "Feta", "Meatballs",
    "Prosciutto", "Cherry Tomato", "Pulled Pork", "Chorizo", "Anchovy", "Capers"
]
var alreadyChosenIngredients = Array<String>()

//print(ingredients[7]) // oregano

//print(ingredients.randomElement()!)
//print(ingredients.last!)
//ingredients.append("Banana")
//print(ingredients.last!)

func generateRandomIngredient() -> String {
    print(alreadyChosenIngredients)
    let newIngredient = ingredients.randomElement()!
    if (alreadyChosenIngredients.contains(newIngredient)) {
        return generateRandomIngredient()
    }
    alreadyChosenIngredients.append(newIngredient)
    return newIngredient
}

print("\(generateRandomIngredient()), \(generateRandomIngredient()), \(generateRandomIngredient()), and \(generateRandomIngredient())")
