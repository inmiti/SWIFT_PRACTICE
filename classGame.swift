
import Foundation


enum GameChoice: Int {
    case paper = 0
    case rock = 1
    case scissors = 2
    case quit = 3 // value quit, rawValue es 3
}

class RockPaperScissors {
    private var userChoice: GameChoice?
    
    func rungameLoop() {
        while true {
            self.userChoice = readUserChoice()
            if isExit() {
                break
            } else {
                let computerChoice = generateComputerChoice()
                print("Computer choose: \(computerChoice)")
                let result = evaluateMove( computerChoice:computerChoice)
                printResult(result: result)
            }
        }
    }
    
    private func readUserChoice() -> GameChoice? {
        
        var userChoice: GameChoice?
        
        while userChoice == nil {
            print("Select one number:")
            print("\(GameChoice.paper.rawValue).Paper")
            print("\(GameChoice.rock.rawValue).Rock")
            print("\(GameChoice.scissors.rawValue).Scissors")
            print("-------------------")
            print("\(GameChoice.quit.rawValue).Quit the game\n") // \n es salto de línea
            print("Your choice:" , terminator: "" )
            guard let userChoiceText = readLine(),
                  let userChoiceRawValue = Int(userChoiceText),
                  let validGameChoice = GameChoice(rawValue:userChoiceRawValue)  // rawValue:userChoiceRawValue es un constructor interno de los enumerados para inicializar un enum a partir de un rawValue.
            else {
                userChoice = nil
                continue // continua el bloque de while
            }
           
            userChoice = validGameChoice
        }

        return userChoice
    }

    private func generateComputerChoice() -> GameChoice {
        let choices: [GameChoice] = [.paper, .rock, .scissors]
        return choices.randomElement()! // Metodo para devolver aleatorio. Se pone exclamacion porque sabemos que siempre va a tener un valor de la lista, y para indicarle al método randomElement que siempre va a tener un elemento de la lista.
    }

    private func evaluateMove(computerChoice: GameChoice) -> String {
        switch (userChoice, computerChoice) {
        case (.rock,.rock), (.paper, .paper), (.scissors, .scissors):
            return "Empate"
        case (.paper,.rock), (.scissors, .paper), (.rock, .scissors):
            return "You win! \(userChoice!) wins \(computerChoice)"
        case (.rock, .paper), ( .paper, .scissors), ( .scissors, .rock):
            return "You lost.... \(computerChoice) wins \(userChoice!)"
        default:
            fatalError()
        }
        
    }

    private func isExit() -> Bool {
        return userChoice == .quit
    }


    private func printResult(result: String) {
        print(result)
    }


}

let rockPaperScissors = RockPaperScissors()
rockPaperScissors.rungameLoop ()

