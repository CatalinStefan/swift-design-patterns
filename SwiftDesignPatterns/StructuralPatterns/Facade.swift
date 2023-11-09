import Foundation

class Comm {
    func sendData(data: String) {
        print("Sending data \(data)")
    }
    
    func receive() {
        print("Receiving response")
    }
}

class Cache {
    func cache() {
        print("Checking cache for outdated data")
    }
}

class Interceptor {
    func intercept() {
        print("Logging any response or error message")
    }
}

class Converter {
    func convert() {
        print("Convert data to JSON")
    }
}

class NetworkAccessFacade {
    let comm = Comm()
    let cache = Cache()
    let interceptor = Interceptor()
    let converter = Converter()
    
    func communicate() {
        cache.cache()
        interceptor.intercept()
        comm.sendData(data: "Some data")
        comm.receive()
        converter.convert()
    }
}

func facadeClient() {
    let facade = NetworkAccessFacade()
    facade.communicate()
}
