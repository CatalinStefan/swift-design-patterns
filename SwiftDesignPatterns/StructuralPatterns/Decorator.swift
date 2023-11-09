import Foundation

protocol CoffeeMachine {
    func makeSmallCoffee()
    func makeLargeCoffee()
}

class BasicCoffeeMachine: CoffeeMachine {
    func makeSmallCoffee() {
        print("Coffee machine: making small coffee")
    }
    
    func makeLargeCoffee() {
        print("Coffee machine: making large coffee")
    }
}

class EnhancedCoffeeMachine: BasicCoffeeMachine {
    let machine: BasicCoffeeMachine
    
    init(machine: BasicCoffeeMachine) {
        self.machine = machine
    }
    
    // Overridden behaviour
    override func makeSmallCoffee() {
        print("Enhanced coffee machine: making small coffee")
    }
    
    // Unaltered behaviour
    override func makeLargeCoffee() {
        machine.makeLargeCoffee()
    }
    
    // Extended behaviour
    func makeMilkCoffee() {
        print("Enhanced coffee machine: making milk coffee")
        machine.makeLargeCoffee()
        print("Enhanced coffee machine: adding milk")
    }
}

func decoratorClient() {
    let basic = BasicCoffeeMachine()
    let enhanced = EnhancedCoffeeMachine(machine: basic)
    
    basic.makeSmallCoffee()
    basic.makeLargeCoffee()
    
    enhanced.makeSmallCoffee()
    enhanced.makeLargeCoffee()
    enhanced.makeMilkCoffee()
}
