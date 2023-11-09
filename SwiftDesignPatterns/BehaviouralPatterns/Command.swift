import Foundation

protocol Command {
    func execute()
}

class OrderAddCommand: Command {
    let id: Int
    let price: Double
    
    init(id: Int, price: Double) {
        self.id = id
        self.price = price
    }
    
    func execute() {
        print("Order id \(id) added with price \(price)")
    }
}

class OrderExecuteCommand: Command {
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func execute() {
        print("Order id \(id) executed")
    }
}

class CommandProcessor {
    var commands = [Command]()
    
    func addCommand(command: Command) -> CommandProcessor {
        commands.append(command)
        return self
    }
    
    func execute() {
        commands.forEach { command in
            command.execute()
        }
    }
}

func commandClient() {
    let processor = CommandProcessor()
    processor
        .addCommand(command: OrderAddCommand(id: 1, price: 12.99))
        .addCommand(command: OrderAddCommand(id: 2, price: 8.99))
        .addCommand(command: OrderExecuteCommand(id: 1))
        .addCommand(command: OrderAddCommand(id: 3, price: 15.99))
        .addCommand(command: OrderExecuteCommand(id: 3))
        .addCommand(command: OrderExecuteCommand(id: 2))
        .execute()
}
