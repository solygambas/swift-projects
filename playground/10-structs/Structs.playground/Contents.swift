struct Pizza {
    var name: String
    //var ingredients: [String] = []
    //var dessertPizza: Bool = false
    var ingredients: [String]
    var dessertPizza: Bool
    
    init() {
        name = "Cheese"
        ingredients = ["Cheese"]
        dessertPizza = false
    }
    
    init(name: String, ingredients: [String], dessertPizza: Bool) {
        self.name = name
        self.ingredients = ingredients
        self.dessertPizza = dessertPizza
    }
}

//let hawaiianPizza = Pizza(name: "Hawaiian", ingredients: ["cheese", "pineapple", "ham", "pizza sauce"])
//let vegPizza = Pizza(name: "Vegetarian Special", ingredients: ["cheese", "avocado", "sundried tomato", "basil"])
//let chickenPizza = Pizza(name: "BBQ Chicken", ingredients: ["chicken", "cheese", "BBQ sauce", "pineapple"])

//var pizza = Pizza()

//struct GarlicBread {
//    var strength: Int
//    var spicyValue: Int
//    var vegan: Bool = false
//    static var count = 0
//
//    init() {
//        self.strength = 1
//        self.spicyValue = 0
//        GarlicBread.count += 1
//    }
//
//    init(strength: Int) {
//        self.strength = strength
//        self.spicyValue = 0
//        print("New Garlic Bread of strength \(strength) created !")
//        GarlicBread.count += 1
//    }
//
//    init(strength: Int, spicyValue: Int) {
//        self.strength = strength
//        self.spicyValue = spicyValue
//        GarlicBread.count += 1
//    }
//
//    init(strength: Int, spicyValue: Int, vegan: Bool) {
//        self.strength = strength
//        self.spicyValue = spicyValue
//        self.vegan = vegan
//        GarlicBread.count += 1
//    }
//}
//
//let garlicBread = GarlicBread()
//let garlicBread2 = GarlicBread(strength: 4)
//let garlicBread3 = GarlicBread(strength: 4, spicyValue: 3)
//let garlicBread4 = GarlicBread(strength: 4, spicyValue: 3, vegan: true)
//print(GarlicBread.count) // 4

//struct PrivataPizza {
//    var name: String
//    private var chefsNotes: String
//
//    init(name: String, chefsNotes: String) {
//        self.name = name
//        self.chefsNotes = chefsNotes
//    }
//}
//
//let hawaiian = PrivataPizza(name: "Hawaiian", chefsNotes: "Don't put too much pineapple")
//print(hawaiian.name)
