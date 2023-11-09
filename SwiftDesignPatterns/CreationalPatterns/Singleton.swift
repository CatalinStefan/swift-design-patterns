import Foundation

struct API {
    static var url = URL(string: "google.com")
}

class NetworkDriver {
    
    let baseUrl: URL?
    static let shared = NetworkDriver(baseUrl: API.url)
    
    private init(baseUrl: URL?) {
        self.baseUrl = baseUrl
    }
}

func singletonClient() {
//    NetworkDriver(baseUrl: "google.com")
    print(NetworkDriver.shared.baseUrl?.absoluteString ?? "")
}
