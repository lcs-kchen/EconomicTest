
import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
}

struct Answer: Identifiable {
    let id = UUID()
    let text: String
}
