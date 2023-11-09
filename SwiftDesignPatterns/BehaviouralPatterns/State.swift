import Foundation

protocol State {
    var game: Game { get }
    
    func onWelcomeScreen()
    func onPlaying()
    func onBreak()
    func onEndGame()
}

class Game {
    var state: State? = nil
    
    init() {
        self.state = WelcomeScreenState(game: self)
    }
    
    func changeState(state: State) {
        self.state = state
    }
}

class WelcomeScreenState: State {
    var game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    func onWelcomeScreen() {
        print("Currently on welcome screen")
    }
    
    func onPlaying() {
        game.changeState(state: PlayingState(game: game))
        print("Moved to playing state")
    }
    
    func onBreak() {
        print("Not allowed")
    }
    
    func onEndGame() {
        print("Not allowed")
    }
}

class PlayingState: State {
    var game: Game
            
    init(game: Game) {
        self.game = game
    }
    
    func onWelcomeScreen() {
        print("Not allowed")
    }
    
    func onPlaying() {
        print("Currently playing")
    }
    
    func onBreak() {
        game.changeState(state: BreakState(game: game))
        print("Moved to break")
    }
    
    func onEndGame() {
        game.changeState(state: EndGameState(game: game))
        print("Moved to end game")
    }
}

class BreakState: State {
    var game: Game
            
    init(game: Game) {
        self.game = game
    }
    
    func onWelcomeScreen() {
        print("Not allowed")
    }
    
    func onPlaying() {
        game.changeState(state: PlayingState(game: game))
        print("Moved to playing")
    }
    
    func onBreak() {
        print("Currently on a break")
    }
    
    func onEndGame() {
        print("Not allowed")
    }
}

class EndGameState: State {
    var game: Game
            
    init(game: Game) {
        self.game = game
    }
    
    func onWelcomeScreen() {
        game.changeState(state: WelcomeScreenState(game: game))
        print("Moved to welcome screen")
    }
    
    func onPlaying() {
        print("Not allowed")
    }
    
    func onBreak() {
        print("Not allowed")
    }
    
    func onEndGame() {
        print("Currently on end game screen")
    }
}

func stateClient() {
    let game = Game()
    game.state?.onWelcomeScreen()
    game.state?.onEndGame()
    game.state?.onPlaying()
    game.state?.onWelcomeScreen()
    game.state?.onBreak()
    game.state?.onPlaying()
    game.state?.onEndGame()
    game.state?.onBreak()
    game.state?.onWelcomeScreen()
    game.state?.onPlaying()
}
