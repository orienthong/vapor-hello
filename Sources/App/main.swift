import Vapor
import Auth

let drop = Droplet()

drop.get { _ in
    //return "Hello Vapor"
    return try JSON(node: [
        "message": "Hello, Vapor"
        ])
}
drop.get("Helloa", "there") { request in // Hello/there
    return try JSON (node: [
        "message": "Hello Vapor"
        ])
}
drop.get("WWDC17") { request in
    return try JSON (node: [
        "message": "Hello WWDC17"
        ])
}

drop.get("beers", Int.self) { request, beers in
    return try JSON(node: [
        "message": "take one down, pass it around, \(beers - 1) bottles of beer on the wall..."
        ])
}

drop.post("post") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return try JSON(node: [
        "name": "Hello \(name)!"
        ])
}

drop.run()
