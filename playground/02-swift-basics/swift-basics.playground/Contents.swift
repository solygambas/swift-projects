// VARIABLES, CONSTANTS & DATA TYPES

// string
"hello"

// int
12
10

// double
4.3
1.2

// bool
true
false

var greeting:String = "Hello, playground"
greeting = "hello again"
//print(greeting)

var myInt:Int = 100
//print(myInt)

let myConstant:String = "hello"
//print(myConstant)

// FUNCTIONS

func myFunc(a:Int, b:Int = 0) -> Int {
    // let a = 10
    // let b = 20
    //print(a+b)
    return a+b
}

// let mySum = myFunc(a: 10, b: 20)
// print(mySum)

// func myFunc2() -> Void {} // returns nothing

// argument labels
func myFunc3(firstNumber a:Int, secondNumber b:Int = 0) -> Int {
    // let a = 10
    // let b = 20
    //print(a+b)
    return a+b
}

// print(myFunc3(firstNumber: 2, secondNumber: 2))

// STRUCTURES

struct ChatView {
    // properties
    var message:String = "Hello"
    var messageWithPrefix:String {
        let prefix = "Chris says: "
        return prefix + message
    }
    
    // view code for this screen
    
    // methods
    func sendChat() {
        //print(messageWithPrefix)
        let db = DatabaseManager()
        let successful = db.saveData(data: message)
    }
    
    func deleteChat() {
        print(messageWithPrefix)
    }
}

// INSTANCES

struct MyStructure {
    var message = "hello"
    
    func myFunction() {
        print(message)
    }
}

var a:MyStructure = MyStructure()
a.message = "Hi"
//a.myFunction()

var b:MyStructure = MyStructure()
b.message = "World"
//b.myFunction()

struct DatabaseManager {
    private var serverName = "Server 1"
    
    func saveData(data: String) -> Bool {
        return true
    }
}
