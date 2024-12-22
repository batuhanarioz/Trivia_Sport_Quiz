import Foundation

struct Trivia {
    var results: [Result]
    
    struct Result: Identifiable {
        
        var id: UUID {
            UUID()
        }
        
        var formattedQuestion: AttributedString
        
        var answers: [Answer]
    }
}
