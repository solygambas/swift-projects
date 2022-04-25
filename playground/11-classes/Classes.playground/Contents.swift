
class Plant {
    var name: String
    var latinName: String
    var type: String
    
    init(name: String, latinName: String, type: String) {
        self.name = name
        self.latinName = latinName
        self.type = type
    }
}

class Succulent: Plant {
    init(name: String, latinName: String) {
        super.init(name: name, latinName: latinName, type: "Succulent")
    }
}

class Tree: Plant {
    init(name: String, latinName: String) {
        super.init(name: name + " tree", latinName: latinName, type: "Tree")
    }
}

let americanAloe = Succulent(name: "American Aloe", latinName: "Agave americana")
let elephantFoot = Succulent(name: "Elephant's foot", latinName: "Beaucarnea recurvata")
let calicoHearts = Succulent(name: "Calico hearts", latinName: "Adromischus maculatus")
let queenVictoria = Succulent(name: "Queen Victoria", latinName: "Agave victoria regina")

let europeanLarch = Tree(name: "European Larch", latinName: "Larix decidua")
let redPine = Tree(name: "Red pine", latinName: "Pinus resinosa")
let northernBeech = Tree(name: "Northern beech", latinName: "Fagus sylvatica")
