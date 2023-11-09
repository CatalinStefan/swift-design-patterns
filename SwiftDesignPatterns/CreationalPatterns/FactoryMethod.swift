import Foundation

enum Cuisine {
    case italian, japanese, american, chinese
}

protocol Restaurant {
    func getCuisine() -> Cuisine
    func getFood() -> String
}

class Luigis: Restaurant {
    func getCuisine() -> Cuisine {
        .italian
    }
    
    func getFood() -> String {
        "Serving pizza"
    }
}

class Sukiya: Restaurant {
    func getCuisine() -> Cuisine {
        .japanese
    }
    
    func getFood() -> String {
        "Serving donburi"
    }
}

class McDonalds: Restaurant {
    func getCuisine() -> Cuisine {
        .american
    }
    
    func getFood() -> String {
        "Serving burger"
    }
}

class KFC: Restaurant {
    func getCuisine() -> Cuisine {
        .american
    }
    
    func getFood() -> String {
        "Serving fried chicken"
    }
}

class FoodHall {
    private var restaurants = [Cuisine: [Restaurant]]()
    
    func registerRestaurant(restaurant: Restaurant) {
        if !restaurants.keys.contains(restaurant.getCuisine()) {
            restaurants[restaurant.getCuisine()] = []
        }
        restaurants[restaurant.getCuisine()]?.append(restaurant)
    }
    
    func getFood(type: Cuisine) -> String? {
        restaurants[type]?.randomElement()?.getFood()
    }
}

func factoryMethodClient() {
    let foodHall = FoodHall()
    foodHall.registerRestaurant(restaurant: Luigis())
    foodHall.registerRestaurant(restaurant: Sukiya())
    foodHall.registerRestaurant(restaurant: McDonalds())
    foodHall.registerRestaurant(restaurant: KFC())
    
    print(foodHall.getFood(type: .japanese))
    print(foodHall.getFood(type: .italian))
    print(foodHall.getFood(type: .american))
}
