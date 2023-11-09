import Foundation

protocol Image {
    func display()
}

class RealImage: Image {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
        print("Real image: loading file \(fileName)")
    }
    
    func display() {
        print("Real image: displaying image \(fileName)")
    }
}

class ProxyImage: Image {
    let fileName: String
    let realImage: RealImage
    
    init(fileName: String) {
        self.fileName = fileName
        self.realImage = RealImage(fileName: fileName)
    }
    
    func display() {
        realImage.display()
        print("Proxy image: logging \(fileName)")
    }
}

func proxyClient() {
    let image: Image = ProxyImage(fileName: "test.png")
    
    image.display()
    print()
    image.display()
}
