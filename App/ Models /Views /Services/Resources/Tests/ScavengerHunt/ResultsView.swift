//
//  ResultsView.swift
//  ScavengerHunt
//
//  Created by Satoof Haj on 2025-10-06.
//

import SwiftUI

struct ResultsView: View {
    let submission: Submission
    @State private var isSubmitting = false
    @State private var submissionDone = false
    private let service = SubmissionService()
    
    var body: some View {
        VStack(spacing: 25) {
            Text("🎉 Congratulations! 🎉")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            
            Text("You found \(submission.foundCount) items!")
                .font(.title2)
            
            Text(submission.rewardMessage)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.blue)
            
            Text("Submitted on: \(submission.dateSubmitted.formatted(date: .abbreviated, time: .shortened))")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Spacer()
            
            if submissionDone {
                Text("✅ Results successfully submitted!")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.bottom, 10)
            }
            
            Button(action: submitResults) {
                if isSubmitting {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(12)
                        .padding(.horizontal)
                } else {
                    Label("Submit Results", systemImage: "paperplane.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .disabled(isSubmitting)
            
            Spacer()
        }
        .padding()
    }
    
    private func submitResults() {
        isSubmitting = true
        service.submit(submission) { success in
            if success {
                submissionDone = true
            }
            isSubmitting = false
        }
    }
}

#Preview {
    ResultsView(submission: Submission(
        playerName: "Tester",
        foundItems: [
            HuntItem(name: "Coffee Shop", clue: "Find the best latte ☕", isFound: true),
            HuntItem(name: "Bookstore", clue: "Find your next story 📚", isFound: true)
        ]
    ))
}

