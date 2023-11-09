import Foundation

class Apartment {
    private var sqm: Int
    private var rooms: Int
    private var city: String
    private var area: String
    private var kitchen: Bool
    
    init(sqm: Int, rooms: Int, city: String, area: String, kitchen: Bool) {
        self.sqm = sqm
        self.rooms = rooms
        self.city = city
        self.area = area
        self.kitchen = kitchen
    }
    
    func display() {
        print("Apartment has:")
        if sqm != -1 {
            print("\(sqm) sqm")
        }
        if rooms != -1 {
            print("\(rooms) rooms")
        }
        if !city.isEmpty {
            print("Apartment is in \(city)")
        }
        if !area.isEmpty {
            print("Apartment is in \(area)")
        }
        if kitchen {
            print("Apartment has a kitchen")
        }
        print()
    }
}

class ApartmentBuilder {
    private var sqm = -1
    private var rooms = -1
    private var city = ""
    private var area = ""
    private var kitchen = false
    
    func setSqm(sqm: Int) -> ApartmentBuilder {
        self.sqm = sqm
        return self
    }
    
    func setRooms(rooms: Int) -> ApartmentBuilder {
        self.rooms = rooms
        return self
    }
    
    func setCity(city: String) -> ApartmentBuilder {
        self.city = city
        return self
    }
    
    func setArea(area: String) -> ApartmentBuilder {
        self.area = area
        return self
    }
    
    func setKitchen(kitchen: Bool) -> ApartmentBuilder {
        self.kitchen = kitchen
        return self
    }
    
    func build() -> Apartment {
        let ap = Apartment(sqm: sqm, rooms: rooms, city: city, area: area, kitchen: kitchen)
        sqm = -1
        rooms = -1
        city = ""
        area = ""
        kitchen = false
        return ap
    }
}

func builderClient() {
    let apartment = ApartmentBuilder()
        .setSqm(sqm: 25)
        .setRooms(rooms: 2)
        .setCity(city: "London")
        .setArea(area: "Kensington")
        .setKitchen(kitchen: true)
        .build()
    apartment.display()
}
