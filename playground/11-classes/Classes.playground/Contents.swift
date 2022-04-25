
class Plant {
    var name: String
    var latinName: String
    var type: String
    var description : String {
        "This is a \(name) (\(latinName) \(type)"
    }
    
    init(name: String, latinName: String, type: String) {
        self.name = name
        self.latinName = latinName
        self.type = type
    }
    
    deinit {
        print("The plant '\(name)' has been deinitialized.")
    }
    
    func printInfo() {
        print("I'm a plant")
    }
}

final class Succulent: Plant {
    var age: Int
    override var description: String {
        "This is a \(super.name) (\(super.latinName)) \(super.type). It is \(age) years old."
    }
    
    init(name: String, latinName: String, age: Int) {
        self.age = age
        super.init(name: name, latinName: latinName, type: "Succulent")
    }
    
    override func printInfo() {
        //super.printInfo()
        print("I'm a Succulent")
    }
}

class Tree: Plant {
    init(name: String, latinName: String) {
        super.init(name: name + " tree", latinName: latinName, type: "Tree")
    }
}

let americanAloe = Succulent(name: "American Aloe", latinName: "Agave americana", age: 5)
//let elephantFoot = Succulent(name: "Elephant's foot", latinName: "Beaucarnea recurvata")
//let calicoHearts = Succulent(name: "Calico hearts", latinName: "Adromischus maculatus")
//let queenVictoria = Succulent(name: "Queen Victoria", latinName: "Agave victoria regina")
//queenVictoria.printInfo()
americanAloe.description

let europeanLarch = Tree(name: "European Larch", latinName: "Larix decidua")
let redPine = Tree(name: "Red pine", latinName: "Pinus resinosa")
let northernBeech = Tree(name: "Northern beech", latinName: "Fagus sylvatica")

// deinit
var _ = Plant(name: "Bay Laurel", latinName: "Laurus nobilis", type: "Evergreen tree")
// The plant 'Bay Laurel' has been deinitialized.

// actor
actor Human {
    var maximumAge = 107
    
    func printAge() {
        print("Max age is currently \(maximumAge)")
    }
    
    func updateMaxAge(from other: Human) async {
        maximumAge = await other.maximumAge
    }
}
