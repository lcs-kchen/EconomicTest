//
//  ContentView.swift
//  Economic Test
//
//  Created by Haowen Chen on 2026-04-14.
//

import SwiftUI

struct EconomicView: View {
    
    let questionViewModel = QuestionListViewModel()
    let answerViewModel = AnswerListViewModel()
    
    @State private var selectedAnswer: Answer? = nil
    
    var body: some View {
        VStack {
            Text(questionViewModel.questions)
                .bold()
            
            // Iterate and make a grid of answers
            
            LazyVGrid(
                columns: [
                    GridItem(),
                    GridItem()
                ],
                spacing: 30
            ) {
                
                ForEach(questionViewModel.answers) { answer in
                    AnswerListViewModel(
                        answer: answer,
                        selectedAnswer: $selectedAnswer
                    )
                }
            }
            

            // Show an explanation once an answer is selected...
            if let selectedAnswer = selectedAnswer {
                Text(selectedAnswer.explanation)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, 10)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
        }
        .navigationTitle("Practice")
    }
    }

//#Preview {
//    ContentView()
//}
