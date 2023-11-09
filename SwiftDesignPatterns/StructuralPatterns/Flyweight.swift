import Foundation

protocol Sprite {
    func draw()
    func move(x: Int, y: Int)
}

enum FighterRank: CaseIterable {
    case PRIVATE, SEARGEANT, MAJOR
    
    static func rand() -> FighterRank {
        allCases.randomElement()!
    }
}

class Fighter: Sprite {
    let rank: FighterRank
    
    init(rank: FighterRank) {
        self.rank = rank
    }
    
    func draw() {
        print("Drawing fighter")
    }
    
    func move(x: Int, y: Int) {
        print("Moving fighter to position x:\(x), y:\(y)")
    }
}

class FighterFactory {
    static var fighters = [FighterRank: Fighter]()
    
    static func getFighter(rank: FighterRank) -> Fighter {
        if !fighters.keys.contains(rank) {
            fighters[rank] = Fighter(rank: rank)
        }
        return fighters[rank]!
    }
}

class Army {
    var army = [Fighter]()
    
    func spawnFighter(rank: FighterRank) {
        let f = FighterFactory.getFighter(rank: rank)
        army.append(f)
    }
    
    func drawArmy() {
        for fighter in army {
            switch fighter.rank {
            case .PRIVATE: print("P ", terminator: "")
            case .SEARGEANT: print("S ", terminator: "")
            case .MAJOR: print("M ", terminator: "")
            }
        }
        print()
    }
}

func flyweightClient() {
    let armySize = 1000
    
    let army = Army()
    (1...armySize).forEach { _ in
        army.spawnFighter(rank: .rand())
    }
    
    army.drawArmy()
}
