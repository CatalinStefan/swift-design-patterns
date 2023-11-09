import Foundation

protocol Service {
    func runService() -> String
}

protocol Response {
    func getResponse() -> String
}

protocol DataSourceAbstractFactory {
    func createService() -> Service
    func createResponse() -> Response
}

class DatabaseService: Service {
    func runService() -> String {
        "Databse service running"
    }
}

class DatabaseResponse: Response {
    func getResponse() -> String {
        "Database response"
    }
}

class NetworkService: Service {
    func runService() -> String {
        "Network service running"
    }
}

class NetworkResponse: Response {
    func getResponse() -> String {
        "Network response"
    }
}

class DatabaseFactory: DataSourceAbstractFactory {
    func createService() -> Service {
        DatabaseService()
    }
    
    func createResponse() -> Response {
        DatabaseResponse()
    }
}

class NetworkFactory: DataSourceAbstractFactory {
    func createService() -> Service {
        NetworkService()
    }
    func createResponse() -> Response {
        NetworkResponse()
    }
}

class Client {
    private let service: Service
    private let response: Response
    
    init(factory: DataSourceAbstractFactory) {
        self.service = factory.createService()
        self.response = factory.createResponse()
    }
    
    func communicate() {
        print(service.runService())
        print(response.getResponse())
    }
}

func abstractFactoryClient() {
    let client1 = Client(factory: DatabaseFactory())
    client1.communicate()
    
    let client2 = Client(factory: NetworkFactory())
    client2.communicate()
}
