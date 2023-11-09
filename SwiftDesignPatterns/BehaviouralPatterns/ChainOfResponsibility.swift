import Foundation

protocol HandlerChain {
    func addHandler(inputHeader: String) -> String
}

class AuthenticationHandler: HandlerChain {
    let token: String
    let next: HandlerChain?
    
    init(token: String, next: HandlerChain? = nil) {
        self.token = token
        self.next = next
    }
    
    func addHandler(inputHeader: String) -> String {
        let outputHeader = "\(inputHeader) \nAuthentication: \(token)"
        if next != nil {
            return next!.addHandler(inputHeader: outputHeader)
        } else {
            return outputHeader
        }
    }
}

class ContentTypeHandler: HandlerChain {
    let contentType: String
    let next: HandlerChain?
    
    init(contentType: String, next: HandlerChain? = nil) {
        self.contentType = contentType
        self.next = next
    }
    
    func addHandler(inputHeader: String) -> String {
        let outputHeader = "\(inputHeader) \nContentType: \(contentType)"
        if next != nil {
            return next!.addHandler(inputHeader: outputHeader)
        } else {
            return outputHeader
        }
    }
}

class PayloadHandler: HandlerChain {
    let payload: String
    let next: HandlerChain?
    
    init(payload: String, next: HandlerChain? = nil) {
        self.payload = payload
        self.next = next
    }
    
    func addHandler(inputHeader: String) -> String {
        let outputHeader = "\(inputHeader) \nPayload: \(payload)"
        if next != nil {
            return next!.addHandler(inputHeader: outputHeader)
        } else {
            return outputHeader
        }
    }
}

func chainOfResponsibilityClient() {
    let payload = PayloadHandler(payload: "Body: {\"username\": \"john\"}")
    let type = ContentTypeHandler(contentType: "json", next: payload)
    let auth = AuthenticationHandler(token: "12345", next: type)
    
    let withAuthentication = auth.addHandler(inputHeader: "### Headers with authentication")
    print(withAuthentication)
    
    let withoutAuthentication = type.addHandler(inputHeader: "### Headers without authentication")
    print(withoutAuthentication)
}
