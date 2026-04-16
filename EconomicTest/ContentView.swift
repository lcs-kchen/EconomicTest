//
//  ContentView.swift
//  Economic Test
//
//  Created by Haowen Chen on 2026-04-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = QuizViewModel()
    @State private var selectedAnswer: Answer? = nil
    @State private var showExplanation = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            Text(viewModel.questions[viewModel.currentIndex].text)
                .font(.title2)
                .bold()

            ForEach(viewModel.questions[viewModel.currentIndex].answers) { answer in
                Button(action: {
                    selectedAnswer = answer
                    showExplanation = true
                }) {
                    HStack {
                        Text(answer.text)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    .background(buttonColor(for: answer))
                    .cornerRadius(10)
                }
                .disabled(showExplanation) // prevent changing answer after selection
            }

            if showExplanation, let selected = selectedAnswer {
                Text(selected.explanation)
                    .padding()
                    .foregroundColor(selected.isCorrect ? .green : .red)
            }

            Spacer()

            if showExplanation {
                Button("Next Question") {
                    goToNextQuestion()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }

    private func buttonColor(for answer: Answer) -> Color {
        guard showExplanation else { return Color.gray.opacity(0.2) }

        if answer.id == selectedAnswer?.id {
            return answer.isCorrect ? Color.green.opacity(0.4) : Color.red.opacity(0.4)
        }

        return Color.gray.opacity(0.2)
    }

    private func goToNextQuestion() {
        if viewModel.currentIndex < viewModel.questions.count - 1 {
            viewModel.currentIndex += 1
        } else {
            viewModel.currentIndex = 0 // restart or handle completion
        }
        selectedAnswer = nil
        showExplanation = false
    }
}


//#Preview {
//    ContentView()
//}
