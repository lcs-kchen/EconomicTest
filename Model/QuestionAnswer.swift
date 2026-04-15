
import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let answers: [Answer]
}

struct Answer: Identifiable {
    let id = UUID()
    let text: String
    let explanation: String
    let isCorrect: Bool
}
