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

print(myFunc3(firstNumber: 2, secondNumber: 2))
