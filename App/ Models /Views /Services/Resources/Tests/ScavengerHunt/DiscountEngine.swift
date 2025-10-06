//
//  DiscountEngine.swift
//  ScavengerHunt
//
//  Created by Satoof Haj  on 2025-10-06.
//

import Foundation

// Handles discount calculations based on the number of items found
struct DiscountEngine {
    
    static func calculateDiscount(foundCount: Int) -> String {
        switch foundCount {
        case 10:
            return "20% Discount + Entry into $5000 Grand Prize!"
        case 7...9:
            return "20% Discount"
        case 5...6:
            return "10% Discount"
        default:
            return "No reward yet. Keep hunting!"
        }
    }
}

