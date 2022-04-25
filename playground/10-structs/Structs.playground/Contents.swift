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

//struct PizzaWithMethod {
//    var name: String
//    var ingredients: [String]
//    // computed properties
//    var lactoseFree: Bool {
//        ingredients.contains("cheese") ? false : true
//    }
//    // property observer
//    var quantity: Int = 10 {
//        didSet {
//            print("The pizza \(name) has \(quantity) pizzas left.")
//        }
//    }
//
//    func getPrice() -> Int {
//        ingredients.count * 2
//    }
//
//    mutating func setName(newName: String) {
//        self.name = newName
//    }
//}
//
//var hawaiianPizza = PizzaWithMethod(name: "Hawaiian", ingredients: ["cheese", "pineapple", "ham", "pizza sauce"])
//hawaiianPizza.getPrice() // 8
//hawaiianPizza.lactoseFree
//hawaiianPizza.setName(newName: "Pineapple")
//hawaiianPizza.name
//let vegPizza = PizzaWithMethod(name: "Vegetarian Special", ingredients: ["avocado", "sundried tomato", "basil"])
//vegPizza.getPrice() // 6
//vegPizza.lactoseFree
//var chickenPizza = PizzaWithMethod(name: "BBQ Chicken", ingredients: ["chicken", "cheese", "BBQ sauce", "pineapple"])
//chickenPizza.getPrice() // 8
//chickenPizza.quantity -= 1 // The pizza BBQ Chicken has 9 pizzas left.

// lazy

struct LazyPizza {
    lazy var cookingDuration = getCookingTime()
}

func getCookingTime() -> Int {
    print("getCookingTime() was called!")
    return 100
}

var hawai = LazyPizza()
print("Lazy property will be generated later")
print(hawai.cookingDuration)
