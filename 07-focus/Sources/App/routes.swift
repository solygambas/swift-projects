import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello", ":name") { req -> String in
        guard let name = req.parameters.get("name") else {
            throw Abort(.internalServerError)
        }
        return "Hello, \(name.capitalized)"
    }
    
    app.get("add", ":number1", ":number2") { req -> String in
        guard
            let number1 = Int(req.parameters.get("number1") ?? "0"),
            let number2 = Int(req.parameters.get("number2") ?? "0")
            else {
                throw Abort(.internalServerError)
        }
        return "\(number1 + number2)"
    }
    
    app.get("multiply", ":number1", ":number2") { req -> String in
        guard
            let number1 = Int(req.parameters.get("number1") ?? "0"),
            let number2 = Int(req.parameters.get("number2") ?? "0")
            else {
                throw Abort(.internalServerError)
        }
        return "\(number1 * number2)"
    }
}
