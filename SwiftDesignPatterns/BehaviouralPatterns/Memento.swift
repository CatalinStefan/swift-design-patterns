import Foundation

class Memento {
    let state: String
    
    init(state: String) {
        self.state = state
    }
}

class Originator {
    var state: String
    
    init(state: String) {
        self.state = state
    }
    
    func createMemento() -> Memento {
        Memento(state: state)
    }
    
    func restoreMemento(memento: Memento?) {
        guard let memento = memento else { return }
        state = memento.state
    }
    
    func printState() {
        print("Current state is \(state)")
    }
}

class Caretaker {
    private var mementoList = [Memento]()
    
    func saveState(state: Memento) {
        mementoList.append(state)
    }
    
    func restoreState(index: Int) -> Memento? {
        if index <= mementoList.count {
            return mementoList[index]
        } else {
            return nil
        }
    }
}

func mementoClient() {
    let originator = Originator(state: "Initial state")
    let caretaker = Caretaker()
    
    caretaker.saveState(state: originator.createMemento())
    originator.printState()
    
    originator.state = "State 1"
    caretaker.saveState(state: originator.createMemento())
    originator.printState()
    
    originator.state = "State 2"
    caretaker.saveState(state: originator.createMemento())
    originator.printState()
    
    originator.restoreMemento(memento: caretaker.restoreState(index: 1))
    originator.printState()
    
    originator.restoreMemento(memento: caretaker.restoreState(index: 0))
    originator.printState()
    
    originator.restoreMemento(memento: caretaker.restoreState(index: 2))
    originator.printState()
}
