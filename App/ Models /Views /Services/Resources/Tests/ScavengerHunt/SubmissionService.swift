//
//  SubmissionService.swift
//  ScavengerHunt
//
//  Created by Satoof Haj  on 2025-10-06.
//

import Foundation

// Handles sending submissions (simulated network service)
class SubmissionService {
    
    // Simulate submitting the player’s results
    func submit(_ submission: Submission, completion: @escaping (Bool) -> Void) {
        print("📤 Submitting results for \(submission.playerName)...")
        print("Found \(submission.foundCount) items")
        print("Reward: \(submission.rewardMessage)")
        
        // Simulate a 2-second delay to mimic server upload
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(true)
        }
    }
}

