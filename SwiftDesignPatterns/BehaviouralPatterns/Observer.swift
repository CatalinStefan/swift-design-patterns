import Foundation

enum EventType: CaseIterable {
    case open, save
}

protocol EventListener: AnyObject {
    func notify(eventType: EventType, file: String)
}

class EventManager {
    private var listeners = [EventType: [EventListener]]()
    
    init(operations: [EventType]) {
        operations.forEach { op in
            listeners[op] = []
        }
    }
    
    convenience init() {
        self.init(operations: EventType.allCases)
    }
    
    func subscribe(event: EventType, listener: EventListener) {
        let users = listeners[event]
        guard let users = users else { return }
        if !users.contains(where: { l in
            l === listener
        }) {
            listeners[event]?.append(listener)
        }
    }
    
    func unsubscribe(event: EventType, listener: EventListener) {
        let users = listeners[event]
        guard let users = users else { return }
        if users.contains(where: { l in
            l === listener
        }) {
            listeners[event]?.removeAll(where: { l in
                l === listener
            })
        }
    }
    
    func notify(event: EventType, file: String) {
        let users = listeners[event]
        guard let users = users else { return }
        users.forEach { l in
            l.notify(eventType: event, file: file)
        }
    }
}

class Editor {
    let events = EventManager()
    var file = ""
    
    func openFile(fileName: String) {
        file = fileName
        events.notify(event: .open, file: file)
    }
    
    func saveFile() {
        if !file.isEmpty {
            events.notify(event: .save, file: file)
        }
    }
}

class EmailNotificationListener: EventListener {
    func notify(eventType: EventType, file: String) {
        print("EmailNotificationListener: \(eventType) performed on file \(file)")
    }
}

class LogOpenListener: EventListener {
    func notify(eventType: EventType, file: String) {
        print("LogOpenListener: \(eventType) performed on file \(file)")
    }
}

func observerClient() {
    let editor = Editor()
    let emailListener = EmailNotificationListener()
    let logListener = LogOpenListener()
    
    editor.events.subscribe(event: .open, listener: emailListener)
    editor.events.subscribe(event: .save, listener: emailListener)
    editor.events.subscribe(event: .open, listener: logListener)
    
    editor.openFile(fileName: "test.jpg")
    editor.saveFile()
}
