import Foundation

class Equipment {
    let name: String
    let price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func getPrice() -> Int {
        price
    }
}

class Composite: Equipment {
    var components = [Equipment]()
    
    init(name: String) {
        super.init(name: name, price: 0)
    }
    
    func add(item: Equipment) -> Composite {
        components.append(item)
        return self
    }
    
    override func getPrice() -> Int {
        var sum = 0
        components.forEach { item in
            sum += item.getPrice()
        }
        return sum
    }
}

func compositeClient() {
    let computer = Composite(name: "PC")
    let processor = Equipment(name: "Processor", price: 1000)
    let hdd = Equipment(name: "Hard drive", price: 250)
    let memory = Composite(name: "Memory")
    let rom = Equipment(name: "Read only memory", price: 75)
    let ram = Equipment(name: "Random access memory", price: 100)
    
    memory
        .add(item: rom)
        .add(item: ram)
    computer
        .add(item: processor)
        .add(item: hdd)
        .add(item: memory)
    
    print("Total \(computer.name) price is \(computer.getPrice())")
}
