import Vapor

func routes(_ app: Application) throws {
//    app.get { req in
//        return "It works!"
//    }

//    app.get("hello", ":name") { req -> String in
//        guard let name = req.parameters.get("name") else {
//            throw Abort(.internalServerError)
//        }
//        return "Hello, \(name.capitalized)"
//    }
    
    // Use Leaf
    app.get("hello") { req async throws -> View in
        return try await req.view.render("hello", ["name": "Leaf"])
    }
    
    app.get { req async throws -> View in
        return try await req.view.render("home", ["title": "Focus"])
    }
    
    app.get("books") { req async throws -> View in
        struct BookList: Codable {
            var title = "Books"
            var books = [
                "Deep Work by Cal Newport",
                "Getting Things Done by David Allen",
                "The Power of Habit by Charles Duhigg"
            ]
        }
        return try await req.view.render("books", BookList())
    }
    
    // Handle params
    app.get("add", ":number1", ":number2") { req -> String in
        guard
            let number1 = req.parameters.get("number1", as: Int.self),
            let number2 = req.parameters.get("number2", as: Int.self)
            else {
                throw Abort(.internalServerError)
        }
        return "\(number1 + number2)"
    }
    
    app.get("multiply", ":number1", ":number2") { req -> String in
        guard
            let number1 = req.parameters.get("number1", as: Int.self),
            let number2 = req.parameters.get("number2", as: Int.self)
            else {
                throw Abort(.internalServerError)
        }
        return "\(number1 * number2)"
    }
}
