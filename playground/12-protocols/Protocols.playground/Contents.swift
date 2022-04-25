// protocols

protocol HasLaserGun {
    func fireLaserGun()
}

protocol HasSpeech {
    func speak()
}

protocol Bipedal {
    func walk()
}

protocol HasArms {
    var armCount: Int { get }
    func gripWith(arm: Int)
}

protocol HasAntenna {
    var antennaCount: Int { get }
}

protocol HasWheels {
    var wheelCount: Int { get }
}

protocol PetrolPowered {
    var petrolPercent: Int { get }
}

// robots

struct RobotSix: HasLaserGun, HasWheels, HasArms, PetrolPowered {
    var wheelCount: Int
    var armCount: Int
    var petrolPercent: Int
    
    func fireLaserGun() {
        print("Gun fired!")
    }
    
    func gripWith(arm: Int) {
        print("Now gripping with arm number \(arm)")
    }
}

struct RobotSeven: HasArms, PetrolPowered {
    var armCount: Int
    var petrolPercent: Int
    
    func gripWith(arm: Int) {
        print("Now gripping with arm number \(arm)")
    }
}

struct RobotEight: HasLaserGun, Bipedal {

    func fireLaserGun() {
        print("Gun fired!")
    }
    
    func walk() {
        print("Walking!")
    }
    
    
}

struct RobotNine: HasWheels, HasAntenna {
    var wheelCount: Int
    var antennaCount: Int
}

struct RobotTen: HasWheels, PetrolPowered, HasSpeech {
    var wheelCount: Int
    var petrolPercent: Int
    
    func speak() {
        print("I'm a robot")
    }
}

var mySixthRobot = RobotSix(wheelCount: 3, armCount: 2,  petrolPercent: 70)
mySixthRobot.fireLaserGun()

var mySeventhRobot = RobotSeven(armCount: 2,  petrolPercent: 70)

var myEightRobot = RobotEight()
myEightRobot.walk()

var myNinthRobot = RobotNine(wheelCount: 3, antennaCount: 1)

var myTenthRobot = RobotTen(wheelCount: 4, petrolPercent: 50)
myTenthRobot.speak()
