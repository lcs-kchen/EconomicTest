
import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let options: [String]
}

struct Answer: Identifiable {
    let id = UUID()
    let text: String
    let correctIndex: Int
}
