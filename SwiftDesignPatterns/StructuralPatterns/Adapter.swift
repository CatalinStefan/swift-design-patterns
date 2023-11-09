import Foundation

class DisplayData3rdParty {
    let index: Double
    let data: String
    
    init(index: Double, data: String) {
        self.index = index
        self.data = data
    }
    
    func displayData() {
        print("Data is displayed: \(index) - \(data)")
    }
}

class DatabaseData {
    let position: Int
    let amount: Int
    
    init(position: Int, amount: Int) {
        self.position = position
        self.amount = amount
    }
}

struct DatabaseDataGenerator {
    static func generateData() -> [DatabaseData] {
        var arr = [DatabaseData]()
        for _ in 1...10 {
            arr.append(DatabaseData(position: Int.random(in: 0...100), amount: Int.random(in: 1...100)))
        }
        return arr
    }
}

protocol DataConverter {
    func convertData(data: [DatabaseData]) -> [DisplayData3rdParty]
}

class DisplayDataAdapter: DataConverter {
    func convertData(data: [DatabaseData]) -> [DisplayData3rdParty] {
        data.map { d in
            DisplayData3rdParty(index: Double(d.position), data: String(d.amount))
        }
    }
}

func adapterClient() {
    let data = DatabaseDataGenerator.generateData()
    let adapter = DisplayDataAdapter()
    
    let legacyData = adapter.convertData(data: data)
    
    legacyData.forEach { d in
        d.displayData()
    }
}
