import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                main()
            } label: {
                Text("Run pattern")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func main() {
    mementoClient()
//    mediatorClient()
//    visitorClient()
//    stateClient()
//    strategyClient()
//    commandClient()
//    chainOfResponsibilityClient()
//    observerClient()
//    flyweightClient()
//    proxyClient()
//    compositeClient()
//    decoratorClient()
//    facadeClient()
//    bridgeClient()
//    adapterClient()
//    prototypeClient()
//    builderClient()
//    abstractFactoryClient()
//    factoryMethodClient()
//    singletonClient()
    print("--------------------------------------")
}
