import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    
    private let staticTrivia: [Trivia.Result] = [
        Trivia.Result(
            formattedQuestion: AttributedString("What sport is considered the most popular in the world?"),
            answers: [
                Answer(text: "Football", isCorrect: true),
                Answer(text: "Tennis", isCorrect: false),
                Answer(text: "Golf", isCorrect: false),
                Answer(text: "Basketball", isCorrect: false)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("What year is officially recognized as the beginning of the modern Olympic Games?"),
            answers: [
                Answer(text: "1886", isCorrect: false),
                Answer(text: "1896", isCorrect: true),
                Answer(text: "1906", isCorrect: false),
                Answer(text: "1916", isCorrect: false)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("In what country was boxer Muhammed Ali born?"),
            answers: [
                Answer(text: "United States", isCorrect: true),
                Answer(text: "United Kingdom", isCorrect: false),
                Answer(text: "Canada", isCorrect: false),
                Answer(text: "Jamaica", isCorrect: false)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("Which club won the UEFA Champions League the most times?"),
            answers: [
                Answer(text: "Manchester United", isCorrect: false),
                Answer(text: "Barcelona", isCorrect: false),
                Answer(text: "AC Milan", isCorrect: false),
                Answer(text: "Real Madrid", isCorrect: true)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("Who won the Golden Ball as the best football player in the world the largest number of times?"),
            answers: [
                Answer(text: "Lionel Messi", isCorrect: true),
                Answer(text: "Cristiano Ronaldo", isCorrect: false),
                Answer(text: "Michel Platini", isCorrect: false),
                Answer(text: "Diego Maradona", isCorrect: false)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("Which player scored the fastest goal in football history?"),
            answers: [
                Answer(text: "Cristiano Ronaldo", isCorrect: false),
                       Answer(text: "Roberto Carlos", isCorrect: true),
                Answer(text: "David Beckham", isCorrect: false),
                Answer(text: "Federico Valverde", isCorrect: false)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("Who is the NBA record holder for the number of scored points for his entire career?"),
            answers: [
                Answer(text: "LeBron James", isCorrect: true),
                Answer(text: "Michael Jordan", isCorrect: false),
                Answer(text: "Kobe Bryant", isCorrect: false),
                Answer(text: "Kareem Abdul-Jabbar", isCorrect: false)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("Which team won the largest number of NBA championships?"),
            answers: [
                Answer(text: "Los Angeles Lakers", isCorrect: false),
                Answer(text: "Boston Celtics", isCorrect: true),
                Answer(text: "Chicago Bulls", isCorrect: false),
                Answer(text: "Miami Heat", isCorrect: false)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("Which team won 73 games at once in the NBA season, setting a record?"),
            answers: [
                Answer(text: "Chicago Bulls", isCorrect: false),
                Answer(text: "Los Angeles Lakers", isCorrect: false),
                Answer(text: "Golden State Warriors", isCorrect: true),
                Answer(text: "Boston Celtics", isCorrect: false)
            ]
        ),
        Trivia.Result(
            formattedQuestion: AttributedString("Which player is known by his nickname “The Big Fundamental” and was the famous centre of the team “San Antonio Spurs”?"),
            answers: [
                Answer(text: "Karl Malone", isCorrect: false),
                Answer(text: "Wilt Chamberlain", isCorrect: false),
                Answer(text: "Tim Duncan", isCorrect: true),
                Answer(text: "David Robinson", isCorrect: false)
            ]
        )
    ]
    
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    
    init() {
        loadStaticTrivia()
    }
    
    func loadStaticTrivia() {
        index = 0
        score = 0
        progress = 0.00
        reachedEnd = false

        self.trivia = staticTrivia
        self.length = self.trivia.count
        setQuestion()
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    

    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)

        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    

    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        if answer.isCorrect {
            score += 1
        }
    }
}
