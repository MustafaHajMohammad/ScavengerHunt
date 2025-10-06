//
//  Submission.swift
//  ScavengerHunt
//
//  Created by Satoof Haj  on 2025-10-06.
//

import Foundation
import SwiftUI

// Represents a player's final submission at the end of the scavenger hunt
struct Submission {
    var playerName: String
    var foundItems: [HuntItem]
    var dateSubmitted: Date = Date()
    
    // Returns the number of items found
    var foundCount: Int {
        foundItems.filter { $0.isFound }.count
    }
    
    // Returns the reward message from DiscountEngine
    var rewardMessage: String {
        DiscountEngine.calculateDiscount(foundCount: foundCount)
    }
}
