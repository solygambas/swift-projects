// protocols

//protocol HasLaserGun {
//    func fireLaserGun()
//}
//
//protocol HasSpeech {
//    func speak()
//}
//
//protocol Bipedal {
//    func walk()
//}
//
//protocol HasArms {
//    var armCount: Int { get }
//    func gripWith(arm: Int)
//}
//
//protocol HasAntenna {
//    var antennaCount: Int { get }
//}
//
//protocol HasWheels {
//    var wheelCount: Int { get }
//}
//
//protocol PetrolPowered {
//    var petrolPercent: Int { get }
//}
//
//// robots
//
//struct RobotSix: HasLaserGun, HasWheels, HasArms, PetrolPowered {
//    var wheelCount: Int
//    var armCount: Int
//    var petrolPercent: Int
//
//    func fireLaserGun() {
//        print("Gun fired!")
//    }
//
//    func gripWith(arm: Int) {
//        print("Now gripping with arm number \(arm)")
//    }
//}
//
//struct RobotSeven: HasArms, PetrolPowered {
//    var armCount: Int
//    var petrolPercent: Int
//
//    func gripWith(arm: Int) {
//        print("Now gripping with arm number \(arm)")
//    }
//}
//
//struct RobotEight: HasLaserGun, Bipedal {
//
//    func fireLaserGun() {
//        print("Gun fired!")
//    }
//
//    func walk() {
//        print("Walking!")
//    }
//
//
//}
//
//struct RobotNine: HasWheels, HasAntenna {
//    var wheelCount: Int
//    var antennaCount: Int
//}
//
//struct RobotTen: HasWheels, PetrolPowered, HasSpeech {
//    var wheelCount: Int
//    var petrolPercent: Int
//
//    func speak() {
//        print("I'm a robot")
//    }
//}
//
//var mySixthRobot = RobotSix(wheelCount: 3, armCount: 2,  petrolPercent: 70)
//mySixthRobot.fireLaserGun()
//
//var mySeventhRobot = RobotSeven(armCount: 2,  petrolPercent: 70)
//
//var myEightRobot = RobotEight()
//myEightRobot.walk()
//
//var myNinthRobot = RobotNine(wheelCount: 3, antennaCount: 1)
//
//var myTenthRobot = RobotTen(wheelCount: 4, petrolPercent: 50)
//myTenthRobot.speak()


protocol Animal {
    var type: String { get }
}

struct Dog: Animal {
    var name: String
    var type: String
    
    func bark() {
        print("Woof!")
    }
}

struct Cat: Animal {
    var name: String
    var type: String
    
    func meow() {
        print("Meow!")
    }
}

struct Pork: Animal {
    var name: String
    var type: String
    
    func oink() {
        print("Oink!")
    }
}

var bunty = Cat(name: "Bunty", type: "British Shorthair")
var nigel = Cat(name: "Nigel", type: "Russian Blue")
var percy = Cat(name: "Percy", type: "Manx")
var argos = Dog(name: "Argos", type: "Whippet")
var apollo = Dog(name: "Apollo", type: "Lowchen")
var babe = Pork(name: "Babe", type: "Pork")

var animals: [Animal] = [bunty, nigel, percy, argos, apollo, babe]

animals.forEach { animal in
    if (animal.self is Cat) {
        let cat = Cat(name: "cat", type: "cat")
        cat.meow()
    } else if (animal.self is Dog) {
        let dog = Dog(name: "dog", type: "dog")
        dog.bark()
    } else if (animal.self is Pork) {
        let pork = Pork(name: "pork", type: "pork")
        pork.oink()
    }
}
