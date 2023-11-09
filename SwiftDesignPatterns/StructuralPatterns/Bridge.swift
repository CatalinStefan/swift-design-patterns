import Foundation

protocol PhoneOS {
    func upload(data: String)
    func download(url: String)
    func display(data: String)
}

class iOS: PhoneOS {
    func upload(data: String) {
        print("iPhone uploading data: \(data)")
    }
    
    func download(url: String) {
        print("iPhone download from: \(url)")
    }
    
    func display(data: String) {
        print("iPhone is displaying data: \(data)")
    }
}

class Android: PhoneOS {
    func upload(data: String) {
        print("Android uploading data: \(data)")
    }
    
    func download(url: String) {
        print("Android download from: \(url)")
    }
    
    func display(data: String) {
        print("Android is displaying data: \(data)")
    }
}

protocol PhoneApp {
    func runApp()
}

class Facebook: PhoneApp {
    let os: PhoneOS
    
    init(os: PhoneOS) {
        self.os = os
    }
    
    func runApp() {
        os.upload(data: "Facebook data upload")
        os.download(url: "facebook.com")
        os.display(data: "facebook data")
    }
}

class Instagram: PhoneApp {
    let os: PhoneOS
    
    init(os: PhoneOS) {
        self.os = os
    }
    
    func runApp() {
        os.upload(data: "Instagram data upload")
        os.download(url: "instagram.com")
        os.display(data: "instagram data")
    }
}

func bridgeClient() {
    let app1 = Facebook(os: iOS())
    let app2 = Instagram(os: Android())
    
    app1.runApp()
    app2.runApp()
}
