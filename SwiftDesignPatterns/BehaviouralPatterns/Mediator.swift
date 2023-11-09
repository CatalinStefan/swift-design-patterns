import Foundation

class ChatUser {
    let name: String
    let mediator: Mediator
    
    init(name: String, mediator: Mediator) {
        self.name = name
        self.mediator = mediator
    }
    
    func sendMessage(message: String) {
        print("\(name): Sending message \(message)")
        mediator.sendMessage(message: message, source: self)
    }
    
    func receiveMessage(message: String) {
        print("\(name): received message: \(message)")
    }
}

class Mediator {
    var users = [ChatUser]()
    
    func addUser(user: ChatUser) -> Mediator {
        users.append(user)
        return self
    }
    
    func sendMessage(message: String, source: ChatUser) {
        users.forEach { user in
            if user !== source {
                user.receiveMessage(message: message)
            }
        }
    }
}

func mediatorClient() {
    let mediator = Mediator()
    let alice = ChatUser(name: "Alice", mediator: mediator)
    let bob = ChatUser(name: "Bob", mediator: mediator)
    let carol = ChatUser(name: "Carol", mediator: mediator)
    
    mediator
        .addUser(user: alice)
        .addUser(user: bob)
        .addUser(user: carol)
    
    carol.sendMessage(message: "Hello everyone!")
}
