import Foundation

class Vehicle {
    var wheels: Int
    var price: Float
    
    init(wheels: Int, price: Float) {
        self.wheels = wheels
        self.price = price
    }
    
    convenience init(vehicle: Vehicle) {
        self.init(wheels: vehicle.wheels, price: vehicle.price)
    }
    
    func clone() -> Vehicle {
        return Vehicle(vehicle: self)
    }
    
    func isClone(target: Vehicle) -> Bool {
        return wheels == target.wheels && price == target.price
    }
}

class Bicycle: Vehicle {
    var cityBike: Bool
    
    init(wheels: Int, price: Float, cityBike: Bool) {
        self.cityBike = cityBike
        super.init(wheels: wheels, price: price)
    }
    
    convenience init(bike: Bicycle) {
        self.init(wheels: bike.wheels, price: bike.price, cityBike: bike.cityBike)
    }
    
    override func clone() -> Vehicle {
        return Bicycle(bike: self)
    }
    
    override func isClone(target: Vehicle) -> Bool {
        if target is Bicycle {
            let t = target as! Bicycle
            return wheels == t.wheels && price == t.price && cityBike == t.cityBike
        }
        return false
    }
}

func prototypeClient() {
    let b1 = Bicycle(wheels: 2, price: 1000, cityBike: true)
    let b2 = b1.clone()
    print("Is b2 a clone of b1? \(b2.isClone(target: b1))")
    
    let b3 = Bicycle(bike: b1)
    print("Is b3 a clone of b1? \(b3.isClone(target: b1))")
    
    let b4 = Bicycle(wheels: 1, price: 500, cityBike: true)
    print("Is b4 a clone of b1? \(b4.isClone(target: b1))")
}
